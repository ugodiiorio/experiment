#!/usr/bin/ruby -w
#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__))

require "rubygems"
gem "rspec", ">=1.2.6"
gem "selenium-client", ">=1.2.16"
require "selenium/client"
#require 'test/spec'
#require "selenium/rspec/spec_helper"

require "test/unit"
require "test/unit/ui/console/testrunner"

class RunBrowser
  attr_reader :kte, :browser, :host, :port, :wait_for_page_to_load, :timeout_in_secs, :sleep_typing, :url

  MODULE_FOLDER = 'modules'
  DLN_LIBRARY_PATH = File.join(File.dirname(__FILE__), '..', MODULE_FOLDER)
  KO = "KO"
  OK = "OK"
  RUN = "RUN"
  FREE = "FREE"

	def initialize(kte = nil)

    @@kte = kte if kte
    @logger = @@kte.logger
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@@kte.company} => CLASS OBJECT ID #{@@kte}"}

  end

  def selenium_setup

    @kte = @@kte
    @browser = @kte.browser_type
    @host = @kte.db_host
    @port = @kte.port
    @wait_for_page_to_load = @kte.wait_for_page_to_load
    @timeout_in_secs = @kte.timeout_in_sec
    @kte.sleep_typing < 1 ? @sleep_typing = @kte.sleep_typing + 0.01*rand(200) : @sleep_typing = @kte.sleep_typing
    @sector_view = view_hash
    
    db_profile = db_connect(@kte.db_driver)
    @url = get_url(db_profile)
    db_disconnect(db_profile)
    
  end

	def load_sector()

    begin
      view = @sector_view[@kte.sector].to_sym
      db_profile = db_connect(@kte.db_driver)
      ds = db_profile.from(view).filter(:key_insurance_profiles_id_num => :$p1,
                                      :key_provider_id_str => :$p2,
                                      :key_sector_id_str => :$p3,
                                      :key_company_id_str => :$p4,
                                      :key_working_set_id_str => :$p5)
      ps = ds.prepare(:select, :select_by_sector)
      if ps.call(:p1=>@kte.profile, :p2=>@kte.provider, :p3=>@kte.sector, :p4=>@kte.company, :p5=>@kte.working_set).count > 0
        ps.call(:p1=>@kte.profile, :p2=>@kte.provider, :p3=>@kte.sector, :p4=>@kte.company, :p5=>@kte.working_set).each do |row|
          row.each do |k, v|
            instance_variable_set(eval(":@#{normalize(k)}"), v)
            @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => instance variable: [@#{normalize(k)}] with value: [#{v}]"}
          end
        end
      else
        raise RangeError, "ATTENTION! Dataset for view #{view} is empty. Please check key fields"
      end
    rescue Sequel::DatabaseError => e
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => MYSQL ERROR: #{e}"} if @logger
      raise
    rescue Exception => ex
      @logger.fatal("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex.class} with message #{ex.message}"} if @logger
      raise
    ensure
    db_disconnect(db_profile)
    end
  end
  
  def load_person()
    begin
      i = 0
      db_profile = db_connect(@kte.db_driver)
      k = db_profile.from(:profiles_personal_data).where(:pers_sex_str => @owner_specification).count
      if k > 0
        one_of_people = (rand(k) +1).to_i
        ds = db_profile.from(:profiles_personal_data).filter(:pers_sex_str => :$p1)
        ps = ds.prepare(:select, :select_by_sex)
        ps.call(:p1 => @owner_specification).each do |row|
          i += 1
          row.each do |k, v|
            instance_variable_set(eval(":@#{normalize(k)}"), v)
            @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => instance variable: [@#{normalize(k)}] with value: [#{v}]"}
          end if i == one_of_people
        end
      else
        raise RangeError, "ATTENTION! Dataset for profiles_personal_data is empty. Please check key fields"
      end

    rescue Sequel::DatabaseError => e
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => MYSQL ERROR: #{e}"}
      raise
    rescue Exception => ex
      @logger.fatal("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex.class} with message: #{ex.message}"}
      raise
    ensure
    db_disconnect(db_profile)
    end
    
	end
	
	def run()

    @kte = @@kte
    begin

      selenium_class = ("#{@kte.company}_#{@kte.sector}").camelize

      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Starting Selenium Page at #{Time.new().to_s()} for profile #{@kte.profile}"}
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Test case log file initializing ..."}

#      start_selenium
      require(File.join(DLN_LIBRARY_PATH, @kte.provider, @kte.sector) + '/' + @kte.company + ".rb")
      test = Test::Unit::UI::Console::TestRunner.new Kernel.const_get(selenium_class)
      result = test.start

#      puts "#{@kte.rc_premium} - #{@kte.rc_cover_code} - #{@kte.test_result} - #{@kte.record}"

      @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => SELENIUM TEST SUITE RESULT: #{result}"}
#      puts result.passed?

      db_monitor = db_connect(@kte.db_monitor)
      if result.passed?
        db_target = db_connect(@kte.db_target)
        insert_premium(db_target)

        update_result(db_monitor, OK, @kte.test_result, RUN)
        @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{"@"*20} PROFILE #{@kte.profile}-[#{@kte.record}] EXECUTED WITH PREMIUM #{@kte.rc_premium} € #{"@"*20}"}

      else

        update_result(db_monitor, KO, @kte.test_result, FREE)
        @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{"@"*20} EXECUTION FOR PROFILE #{@kte.profile}-#{@kte.record} ABORTED #{"@"*20}"}
      end

    rescue Sequel::DatabaseError => e
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => MYSQL ERROR #{e.class} with message: #{e}"} if @logger
      raise e
    rescue Exception => ex
      @logger.fatal("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex.class} with message: #{ex.message}"} if @logger
      raise ex
    ensure
      db_disconnect(db_monitor) if db_monitor
      db_disconnect(db_target) if db_target
    end

  end

end

def view_hash()

  view = Hash.new
  view = {
    'sect_1' => 'sector_1',
    'sect_2' => 'sector_2',
    'sect_3' => 'sector_3',
    'sect_4' => 'sector_4',
    }
end

def normalize(var)

  arr_var = var.to_s.split("_")
  arr_var.pop
  arr_var.delete(arr_var.first)
  var = arr_var.collect{|a| a + "_"}.to_s.chop.downcase
  return var

end

def db_connect(db)
  return Sequel.mysql(:database => db, :user => @kte.db_conn_user, :password => @kte.db_conn_pwd, :host => @kte.db_host, :loggers => @logger)
end

def count_profiles(db)
#  @DB_PROFILE.loggers << @kte.logger
  count = db.from(:company_insurance_profiles).count
  return count
end

def db_disconnect(db)
  db.disconnect
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

