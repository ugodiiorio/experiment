#!/usr/bin/ruby

# Module defined in utils.rb file

#  def method_name
#    if  /`(.*)'/.match(caller.first)
#      return $1
#    end
#    nil
#  end

module DbSetters

  LOCK = "LOCK"
  OK = "OK"
  DUPLICATE_KEY = "Duplicate entry"

  def not_free_profile?()

    begin
      @new_lock= false

      db_monitor = db_connect(@kte.db_monitor)
      count = update_lock(db_monitor)

      insert_lock(db_monitor) unless existing_profile?(count)

      db_disconnect(db_monitor)

      return profile_locked?(@new_lock)

    rescue Sequel::DatabaseError => e
      if e.wrapped_exception.to_s.gsub(DUPLICATE_KEY)
        @logger.warn(__FILE__ +  ' => ' + method_name) {"#{@kte.company} => MYSQL WARNING: #{e}"}
        @new_lock= false
        return profile_locked?(@new_lock)
      else
        @logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{e.class} MYSQL ERROR with message: #{e}"}
        raise
      end
    rescue Exception => ex
      @logger.fatal(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex.class} with message: #{ex.message}"}
      raise
    end

	end

  def existing_profile?(n)
    begin
      1.div(n)
      return true
    rescue
      return false
    end
  end

  def profile_locked?(bool)
		case bool
		when false
      @logger.warn(__FILE__ +  ' => ' + method_name) {"#{@kte.company} => Check profile availability NOT PASSED"}
      return true
		else
      @logger.debug(__FILE__ +  ' => ' + method_name) {"#{@kte.company} => Check profile availability PASSED"}
      return false
		end
  end

  def db_connect(db)
    return Sequel.mysql(:database => db, :user => @kte.db_conn_user, :password => @kte.db_conn_pwd, :host => @kte.db_host, :loggers => @logger)
  end

  def db_disconnect(db)
    db.disconnect
  end

  def update_lock(db)

    @state, @result = nil, nil
    db.run "START TRANSACTION;"
    ds = db['select state_str, result_str from scheduler where key_insurance_profiles_id_num = ? AND
                                              key_provider_id_str = ? AND
                                              key_sector_id_str = ? AND
                                              key_company_id_str = ? AND
                                              key_working_set_id_str = ? AND
                                              key_rate_id_str = ? for UPDATE',
                                              @kte.profile, @kte.provider, @kte.sector, @kte.company, @kte.working_set, @kte.rate]
    count = ds.count
    ds.first.each {|r| @state = r[1] if r[0] == :state_str; @result = r[1] if r[0] == :result_str}  if existing_profile?(count)
#      state, result  = ds.first[:state_str], ds.first[:result_str] if existing_profile?(count)

    db.transaction do
      schedules = db[:scheduler]
      schedules.filter(:key_insurance_profiles_id_num => @kte.profile,
                                      :key_provider_id_str => @kte.provider,
                                      :key_sector_id_str => @kte.sector,
                                      :key_company_id_str => @kte.company,
                                      :key_working_set_id_str => @kte.working_set,
                                      :key_rate_id_str => @kte.rate).update(:state_str => LOCK, :start_update => Time.new())
      @new_lock= true #unless result == OK
    end unless @state == LOCK unless @result == OK if existing_profile?(count)
    db.run "COMMIT;"
    return count

  end

  def insert_lock(db)

    db.transaction do
      ps = db[:scheduler].prepare(:insert, :insert_for_lock,
                                      :key_insurance_profiles_id_num => :$p1,
                                      :key_provider_id_str => :$p2,
                                      :key_sector_id_str => :$p3,
                                      :key_company_id_str => :$p4,
                                      :key_working_set_id_str => :$p5,
                                      :key_rate_id_str => :$p6,
                                      :state_str => :$p7,
                                      :start_update => :$p8)
      ps.call(:p1=>@kte.profile, :p2=>@kte.provider, :p3=>@kte.sector, :p4=>@kte.company, :p5=>@kte.working_set, :p6=>@kte.rate, :p7=>LOCK, :p8=>Time.new())
      @new_lock= true
    end 

  end
  
  def count_profiles(db)
    ds = db.from(:company_insurance_profiles).filter(
                                    :key_provider_id_str => :$p1,
                                    :key_sector_id_str => :$p2,
                                    :key_company_id_str => :$p3,
                                    :key_working_set_id_str => :$p4)
    ps = ds.prepare(:select, :select_count_profiles)
    count = ps.call(:p1=>@kte.provider, :p2=>@kte.sector, :p3=>@kte.company, :p4=>@kte.working_set).count

    return count
  end

  def get_url(db)
    ds = db[:companies].where(:key_companies_group_id_str => @kte.company_group, :key_company_id_str => @kte.company)
    return url = ds.first[:site_url_str]
  end

  def update_result(db, result, message, state)

    db.transaction do
      schedules = db[:scheduler]
      schedules.filter( :key_insurance_profiles_id_num => @kte.profile,
                        :key_provider_id_str => @kte.provider,
                        :key_sector_id_str => @kte.sector,
                        :key_company_id_str => @kte.company,
                        :key_working_set_id_str => @kte.working_set,
                        :key_rate_id_str => @kte.rate).update(:result_str => result, :result_message_str => message, :state_str => state)
    end

  end

  def insert_premium(db)

    db.transaction do
      ps = db[:premiums].prepare(:insert, :insert_for_premium,
                                      :key_insurance_profiles_id_num => :$p1,
                                      :key_provider_id_str => :$p2,
                                      :key_sector_id_str => :$p3,
                                      :key_company_id_str => :$p4,
                                      :key_working_set_id_str => :$p5,
                                      :key_rate_id_str => :$p6,
                                      :key_cover_id_str => :$p7,
                                      :record_id_str => :$p8,
                                      :premium_num => :$p9)
      ps.call(:p1=>@kte.profile, :p2=>@kte.provider, :p3=>@kte.sector, :p4=>@kte.company, :p5=>@kte.working_set, :p6=>@kte.rate, :p7=>@kte.rc_cover_code, :p8=>@kte.record, :p9=>@kte.rc_premium)
    end

  end

  def select_sector(db, v)
    ds = db.from(v).filter(:key_insurance_profiles_id_num => :$p1,
                                    :key_provider_id_str => :$p2,
                                    :key_sector_id_str => :$p3,
                                    :key_company_id_str => :$p4,
                                    :key_working_set_id_str => :$p5)
    ps = ds.prepare(:select, :select_by_sector)
    sect_arr = ps.call(:p1=>@kte.profile, :p2=>@kte.provider, :p3=>@kte.sector, :p4=>@kte.company, :p5=>@kte.working_set)
    return sect_arr
  end
  
  def count_people(db)
    return count = db.from(:profiles_personal_data).where(:pers_sex_str => @owner_specification).count
  end
  
  def select_person(db)
    ds = db.from(:profiles_personal_data).filter(:pers_sex_str => :$p1)
    ps = ds.prepare(:select, :select_by_sex)
    person_arr = ps.call(:p1 => @owner_specification)
    return person_arr
  end

end
