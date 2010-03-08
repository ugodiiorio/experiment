require "rubygems"
gem "rspec", ">=1.2.6"
gem "selenium-client", ">=1.2.16"
require 'test/spec'
require "selenium/client"
require "selenium/rspec/spec_helper"

require "test/unit"
require "test/unit/ui/console/testrunner"

class RunBrowser
  attr_reader :kte, :browser, :host, :port, :wait_for_page_to_load, :timeout_in_secs, :sleep_typing

  MODULE_FOLDER = 'modules'
  DLN_LIBRARY_PATH = File.join(File.dirname(__FILE__), '..', MODULE_FOLDER)
  KO = "KO"
  OK = "OK"
  RUN = "RUN"
  FREE = "FREE"

	def initialize(kte = nil)

    @@kte = kte if kte
    @logger = @@kte.logger
    puts @@kte

  end

  def selenium_setup

    @kte = @@kte
    @browser = @kte.browser_type
    @host = @kte.db_host
    @port = @kte.port
    @wait_for_page_to_load = @kte.wait_for_page_to_load
    @timeout_in_secs = @kte.timeout_in_sec
    @sleep_typing +=  0.01*rand(200) if @kte.sleep_typing < 1
    @DB_PROFILE = Sequel.mysql(:database => @kte.db_driver, :user => @kte.db_conn_user, :password => @kte.db_conn_pwd, :host => @kte.db_host, :loggers => @logger)

  end

	def person()

    begin
      ds = @DB_PROFILE.from(:sector_1).filter(:key_insurance_profiles_id_num => :$p1,
                                      :key_provider_id_str => :$p2,
                                      :key_sector_id_str => :$p3,
                                      :key_company_id_str => :$p4,
                                      :key_working_set_id_str => :$p5)
      ps = ds.prepare(:select, :select_by_sector)
      ps.call(:p1=>@kte.profile, :p2=>@kte.provider, :p3=>@kte.sector, :p4=>@kte.company, :p5=>@kte.working_set).each do |row|
        row.each do |k, v|
          instance_variable_set(eval(":@#{normalize(k)}"), v)
#          puts instance_variable_get("@#{normalize(k)}")
        end
      end
    rescue Sequel::DatabaseError => e
      @logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => MYSQL ERROR: #{e}"} if @logger
      raise
    rescue Exception => ex
      puts ex.class
      @logger.fatal(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex.message}"} if @logger
      raise
    ensure
      @DB_PROFILE.disconnect
    end
  end
  def sector()
    begin
      i = 0
      k = @DB_PROFILE.from(:profiles_personal_data).where(:pers_sex_str => @owner_specification).count
      one_of_people = (rand(k) +1).to_i
      ds = @DB_PROFILE.from(:profiles_personal_data).filter(:pers_sex_str => :$p1)
      ps = ds.prepare(:select, :select_by_sex)
      ps.call(:p1 => @owner_specification).each do |row|
        i += 1
        row.each do |k, v|
          instance_variable_set(eval(":@#{normalize(k)}"), v)
        end if i == one_of_people
      end

    rescue Sequel::DatabaseError => e
      @logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => MYSQL ERROR: #{e}"}
      raise
    rescue Exception => ex
      puts ex.class
      @logger.fatal(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex.message}"}
      raise
    ensure
      @DB_PROFILE.disconnect
    end
    
	end
	
	def run()

    kte = @@kte
    begin

      selenium_class = (kte.company + '_' + kte.sector).camelize

      @DB_MONITOR = Sequel.mysql(:database => kte.db_monitor, :user => kte.db_conn_user, :password => kte.db_conn_pwd, :host => kte.db_host, :loggers => @logger)
      @DB_TARGET = Sequel.mysql(:database => kte.db_target, :user => kte.db_conn_user, :password => kte.db_conn_pwd, :host => kte.db_host, :loggers => @logger)
      @DB_MONITOR.transaction do
        schedules = @DB_MONITOR[:scheduler]
        schedules.filter( :key_insurance_profiles_id_num => kte.profile,
                          :key_provider_id_str => kte.provider,
                          :key_sector_id_str => kte.sector,
                          :key_company_id_str => kte.company,
                          :key_working_set_id_str => kte.working_set,
                          :key_rate_id_str => kte.rate).update(:result_str => KO, :start_update => Time.new())
      end

      @logger.info(__FILE__ + ' => ' + method_name) {"#{kte.company} => Starting Selenium Page at #{Time.new().to_s()} for profile #{kte.profile}"}
#      kte.selenium_io == STDOUT ? $Result_file = File.new(kte.selenium_io, "a") : $Result_file = kte.selenium_io
      @logger.debug(__FILE__ + ' => ' + method_name) {"#{kte.company} => Test case log file initializing ..."}

#      start_selenium
      load(File.join(DLN_LIBRARY_PATH, kte.provider, kte.sector) + '/' + kte.company + ".rb")
      test = Test::Unit::UI::Console::TestRunner.new Kernel.const_get(selenium_class)
      result = test.start
      puts kte.rca_premium
      puts kte.test_result

      @logger.info(__FILE__ + ' => ' + method_name) {"#{kte.company} => Selenium result: #{result.to_s}"}
      puts result.passed?

      if result.passed?
        @DB_MONITOR.transaction do
          schedules = @DB_MONITOR[:scheduler]
          schedules.filter( :key_insurance_profiles_id_num => kte.profile,
                            :key_provider_id_str => kte.provider,
                            :key_sector_id_str => kte.sector,
                            :key_company_id_str => kte.company,
                            :key_working_set_id_str => kte.working_set,
                            :key_rate_id_str => kte.rate).update(:result_str => OK, :result_message_str => kte.test_result, :state_str => RUN)
          end
          @logger.info(__FILE__ + ' => ' + method_name) {"#{kte.company} => Execution for profile #{kte.profile.to_s} PASSED"}
      else
        @DB_MONITOR.transaction do
          schedules = @DB_MONITOR[:scheduler]
          schedules.filter( :key_insurance_profiles_id_num => kte.profile,
                            :key_provider_id_str => kte.provider,
                            :key_sector_id_str => kte.sector,
                            :key_company_id_str => kte.company,
                            :key_working_set_id_str => kte.working_set,
                            :key_rate_id_str => kte.rate).update(:result_str => KO, :result_message_str => kte.test_result, :state_str => FREE)
          end
          @logger.info(__FILE__ + ' => ' + method_name) {"#{kte.company} => Execution for profile #{kte.profile.to_s} NOT PASSED"}
      end

    rescue Sequel::DatabaseError => e
      @logger.error(__FILE__ + ' => ' + method_name) {"#{kte.company} => MYSQL ERROR: #{e}"} if @logger
      raise
    rescue Exception => ex
      puts ex.class
      @logger.fatal(__FILE__ + ' => ' + method_name) {"#{kte.company} => #{ex.message}"} if @logger
      raise
    ensure
      @DB_MONITOR.disconnect
    end

  end

end

def normalize(var)

  arr_var = var.to_s.split("_")
  arr_var.pop
  arr_var.delete(arr_var.first)
  var = arr_var.collect{|a| a + "_"}.to_s.chop.downcase
  return var

end
