#!/usr/bin/ruby

# Module defined in specific_profile.rb file

#  def method_name
#    if  /`(.*)'/.match(caller.first)
#      return $1
#    end
#    nil
#  end

module Utils

  LOCK = "LOCK"
  DUPLICATE_KEY = "Duplicate entry"

  def locked_profile?()

    begin
      new_lock, @state = false, LOCK

      @DB = Sequel.mysql(:database => "kte_monitor", :user => $db_conn_user, :password => $db_conn_pwd, :host => $db_ip)
      @DB.loggers << @logger
      @DB.run "START TRANSACTION;"
      ds = @DB['select state_str from scheduler where key_insurance_profiles_id_num = ? AND
                                                key_provider_id_str = ? AND
                                                key_sector_id_str = ? AND
                                                key_company_id_str = ? AND
                                                key_working_set_id_str = ? AND
                                                key_rate_id_str = ? for UPDATE',
                                                @profile, @provider, @sector, @company, @working_set, $rilevazione]
      count = ds.count
      @state = ds.first[:state_str] if existing_profile?(count)
      @DB.transaction do
        ps = @DB[:scheduler].prepare(:update, :update_for_lock,
                                        :key_insurance_profiles_id_num => :$p1,
                                        :key_provider_id_str => :$p2,
                                        :key_sector_id_str => :$p3,
                                        :key_company_id_str => :$p4,
                                        :key_working_set_id_str => :$p5,
                                        :key_rate_id_str => :$p6,
                                        :state_str => :$p7)
        ps.call(:p1=>@profile, :p2=>@provider, :p3=>@sector, :p4=>@company, :p5=>@working_set, :p6=>$rilevazione, :p7=>LOCK)
        new_lock= true
      end unless @state == LOCK
      @DB.run "COMMIT;"

      @DB.transaction do
        ps = @DB[:scheduler].prepare(:insert, :insert_for_lock,
                                        :key_insurance_profiles_id_num => :$p1,
                                        :key_provider_id_str => :$p2,
                                        :key_sector_id_str => :$p3,
                                        :key_company_id_str => :$p4,
                                        :key_working_set_id_str => :$p5,
                                        :key_rate_id_str => :$p6,
                                        :state_str => :$p7)
        ps.call(:p1=>@profile, :p2=>@provider, :p3=>@sector, :p4=>@company, :p5=>@working_set, :p6=>$rilevazione, :p7=>LOCK)
        new_lock= true
      end unless existing_profile?(count)

      @DB.disconnect

      return profile_locked?(new_lock)

    rescue Sequel::DatabaseError => e
      if e.wrapped_exception.to_s.gsub(DUPLICATE_KEY)
        @logger.warn(__FILE__ +  ' => ' + method_name) {"#{@company} => Warning message: #{e}"}
        new_lock= false
        return profile_locked?(new_lock)
      else
        @logger.error(__FILE__ + ' => ' + method_name) {"#{@company} => Error message: #{e}"}
        raise
      end
    rescue Exception => ex
      puts ex.class
      @logger.fatal(__FILE__ + ' => ' + method_name) {"#{@company} => #{ex.message}"}
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
      @logger.warn(__FILE__ +  ' => ' + method_name) {"#{@company} => Check profile availability NOT PASSED with state #{@state}"}
      return true
		else
      @logger.info(__FILE__ +  ' => ' + method_name) {"#{@company} => Check profile availability PASSED with state #{@state}"}
      return false
		end
  end

end
