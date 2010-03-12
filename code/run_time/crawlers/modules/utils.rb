#!/usr/bin/ruby

# Module defined in utils.rb file

#  def method_name
#    if  /`(.*)'/.match(caller.first)
#      return $1
#    end
#    nil
#  end

module Utils

  LOCK = "LOCK"
  OK = "OK"
  DUPLICATE_KEY = "Duplicate entry"

  def locked_profile?()

    begin
      @new_lock= false

      db_monitor = db_connect(@kte.db_monitor)
#      @DB = Sequel.mysql(:database => @kte.db_monitor, :user => @kte.db_conn_user, :password => @kte.db_conn_pwd, :host => @kte.db_host)
#      @DB.loggers << @kte.logger

      count = update_lock(db_monitor)

      insert_lock(db_monitor) unless existing_profile?(count)

      db_disconnect(db_monitor)

      return profile_locked?(@new_lock)

    rescue Sequel::DatabaseError => e
      if e.wrapped_exception.to_s.gsub(DUPLICATE_KEY)
        @kte.logger.warn(__FILE__ +  ' => ' + method_name) {"#{@kte.company} => MYSQL WARNING: #{e}"}
        @new_lock= false
        return profile_locked?(@new_lock)
      else
        @kte.logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => MYSQL ERROR: #{e}"}
        raise
      end
    rescue Exception => ex
#      puts ex.class
      @kte.logger.fatal(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex.message}"}
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
      @kte.logger.warn(__FILE__ +  ' => ' + method_name) {"#{@kte.company} => Check profile availability NOT PASSED"}
      return true
		else
      @kte.logger.info(__FILE__ +  ' => ' + method_name) {"#{@kte.company} => Check profile availability PASSED"}
      return false
		end
  end

  def db_connect(db)
    return Sequel.mysql(:database => db, :user => @kte.db_conn_user, :password => @kte.db_conn_pwd, :host => @kte.db_host, :loggers => @kte.logger)
  end

  def count_profiles(db)
  #  @DB_PROFILE.loggers << @kte.logger
    count = db.from(:company_insurance_profiles).count
    return count
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
  
end
