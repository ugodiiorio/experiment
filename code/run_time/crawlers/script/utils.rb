#!/usr/bin/ruby

# Module defined in specific_profile.rb file


module Utils

  LOCK = "LOCK"
  NEWLOCK = "NEW_LOCK"

  def locked_profile?()

    begin
    @DB = Sequel.mysql(:database => "kte_monitor", :user => $db_conn_user, :password => $db_conn_pwd, :host => $db_ip)
    @DB.loggers << @logger
#    ds = @DB.from(:scheduler).filter(:key_insurance_profiles_id_num => :$p1,
#                                    :key_provider_id_str => :$p2,
#                                    :key_sector_id_str => :$p3,
#                                    :key_company_id_str => :$p4,
#                                    :key_working_set_id_str => :$p5,
#                                    :key_rate_id_str => :$p6)
#    ps = ds.prepare(:select, :select_for_lock)
#    profile_count = (ps.call(:p1=>@profile, :p2=>@provider, :p3=>@sector, :p4=>@company, :p5=>@working_set, :p6=>$rilevazione).count)
#
    @DB.run "START TRANSACTION;"
    ds = @DB['select state_str from scheduler where key_insurance_profiles_id_num = ? AND
                                              key_provider_id_str = ? AND
                                              key_sector_id_str = ? AND
                                              key_company_id_str = ? AND
                                              key_working_set_id_str = ? AND
                                              key_rate_id_str = ? for UPDATE',
                                              @profile, @provider, @sector, @company, @working_set, $rilevazione]
    count = ds.count
    state = ds.first[:state_str] if existing_profile?(count)
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
      state = NEWLOCK
    end unless existing_profile?(count)

    @DB.disconnect

    return profile_locked?(state)

    rescue Exception => ex
      @logger.fatal('CheckAndGo.locked_profile? => ' + @company) {ex.message}
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

  def profile_locked?(state)
		case state
		when "LOCK"
      @logger.warn('CheckAndGo.locked_profile? => ' + @company) {"Check profile availability NOT PASSED"}
      return true
		else
      @logger.info('CheckAndGo.locked_profile? => ' + @company) {"Check profile availability PASSED"}
      return false
		end
    puts "Cell State: "+ state
  end

end

