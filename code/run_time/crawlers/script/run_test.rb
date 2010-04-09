#!/usr/bin/ruby -w
#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__))

require "rubygems"
gem "selenium-client", ">=1.2.16"
require "selenium/client"

require "test/unit"
require "test/unit/ui/console/testrunner"

class RunTest
  attr_reader :kte, :browser, :host, :port, :wait_for_page_to_load, :timeout_in_secs, :url

  TEST_CASE_FOLDER, USE_CASE_FOLDER = 'modules', 'use_case'
  TC_LIBRARY_PATH = File.join(File.dirname(__FILE__), '..', TEST_CASE_FOLDER)
  UC_LIBRARY_PATH = File.join(File.dirname(__FILE__), '..', USE_CASE_FOLDER)
  KO, OK, RUN, FREE = "KO", "OK", "RUN", "FREE"

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
    @kte.sleep_typing < 1 ? @kte.sleep_typing = @kte.sleep_typing + 0.01*rand(200) : @kte.sleep_typing
    @sector_view = view_hash

    sector = @kte.sector
    db_profile = db_connect(@kte.db_driver)
    @url = eval(get_url(db_profile))
    db_disconnect(db_profile)
    
  end

	def load_sector()

    begin
      view = @sector_view[@kte.sector].to_sym
      db_profile = db_connect(@kte.db_driver)
      sector_profile = select_sector(db_profile, view)
      if sector_profile.count > 0
        sector_profile.each do |row|
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
      people = count_people(db_profile)
      if people > 0
        one_of_people = (rand(people) +1).to_i
        specific_person = select_person(db_profile)
        specific_person.each do |row|
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

      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Starting Selenium Page at #{Time.new().to_s()} for profile #{@kte.profile}"}
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Test case log file initializing ..."}

#      start_selenium
      case @kte.use_case.empty?
        when true
          selenium_class = ("#{@kte.company}_#{@kte.sector}").camelize
          require("#{File.join(TC_LIBRARY_PATH, @kte.provider, @kte.sector)}/#{@kte.company}_#{@kte.sector}.rb")
        else
          selenium_class = ("#{@kte.company}_#{@kte.use_case}").camelize
          require("#{File.join(UC_LIBRARY_PATH, @kte.provider)}/#{@kte.company}_#{@kte.use_case}.rb")
      end

      test = Test::Unit::UI::Console::TestRunner.new Kernel.const_get(selenium_class)
      result = test.start
      test_errors = result.instance_variable_get("@errors")[0]
      test_failures = result.instance_variable_get("@failures")[0]

      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => SELENIUM TEST SUITE RESULT: #{test_errors}"} if test_errors
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => SELENIUM TEST SUITE RESULT: #{test_failures}"} if test_failures
      @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => SELENIUM TEST SUITE RESULT: #{result}"}
#      puts result.passed?

      db_monitor = db_connect(@kte.db_monitor)
      if result.passed?
        db_target = db_connect(@kte.db_target)
        insert_premium(db_target)
        store_parameters(db_target) if @kte.store_params

        update_result(db_monitor, OK, @kte.test_result, RUN)
        @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{"@"*20} PROFILE #{@kte.profile}-[#{@kte.record}] EXECUTED WITH PREMIUM #{@kte.rc_premium} € #{"@"*20}"}

      else

        update_result(db_monitor, KO, @kte.test_result, FREE)
        @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{"@"*20} EXECUTION FOR PROFILE #{@kte.profile}-#{@kte.record} ABORTED #{"@"*20}"}
      end

    rescue Sequel::DatabaseError => e
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{"@"*20} MYSQL ERROR #{e.class} with message: #{e} - EXECUTION FOR PROFILE #{@kte.profile}-#{@kte.record} ABORTED #{"@"*20}"} if @logger
      raise e
    rescue Exception => ex
      @logger.fatal("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{"@"*20} #{ex.class} with message: #{ex.message} - EXECUTION FOR PROFILE #{@kte.profile}-#{@kte.record} ABORTED #{"@"*20}"} if @logger
      raise ex
    ensure
      db_disconnect(db_monitor) if db_monitor
      db_disconnect(db_target) if db_target
    end

  end

end
