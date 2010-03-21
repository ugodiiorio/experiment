#!/usr/bin/ruby -w
#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__)) 

require "rubygems"
require "date.rb"
require "date/format.rb"
require 'chronic'
require "yaml"
require 'logger'
require 'sequel'
require 'mysql'

MODULE_FOLDER = 'modules'
DB_SETTERS = 'db_setters.rb'
EXTENSIONS = 'kte_ext.rb'
TEST_SUITE = 'run_test.rb'
DLN_LIBRARY_PATH = File.join(File.dirname(__FILE__), '..', MODULE_FOLDER)

require("#{File.join(DLN_LIBRARY_PATH)}/#{DB_SETTERS}")
require("#{File.join(DLN_LIBRARY_PATH)}/#{EXTENSIONS}")
require("#{File.join(File.dirname(__FILE__))}/#{TEST_SUITE}")
include DbSetters
include KteExt

class KTE
  attr_reader :logger, :company_group, :company, :provider, :sector, :working_set, :rate, :rate_date
  attr_reader :log_device, :log_level
  attr_reader :port, :selenium_io, :wait_for_page_to_load, :timeout_in_sec, :browser_type
  attr_reader :db_host, :db_conn_user, :db_conn_pwd, :db_driver, :db_monitor, :db_target
  attr_accessor :profile, :record, :rc_cover_code, :rc_premium, :test_result, :max_profiles, :sleep_typing, :sleep_between_profiles

  def initialize
    begin
      @logger = nil
      @rc_premium, @rc_cover_code, @record, @test_result = 0, nil, nil, nil

      begin

        case ARGV.size()
        when 0, 1
          @config_file = ARGV[0]
          @config_file = __FILE__+'.yml' unless ARGV[0]
          File.open(@config_file)
          config = YAML::load(File.open(@config_file))
          general_settings = config['general_settings']
          logger_settings = config['logger_settings']
          selenium_settings = config['selenium_settings']
          database_settings = config['database_settings']
          app_settings = config['app_settings']

          logger_settings['ls_device'] = STDOUT if logger_settings['ls_device'] == 'STDOUT'
          selenium_settings['ss_io_device'] = STDOUT if selenium_settings['ss_io_device'] == 'STDOUT'
          ARGV[0] = nil
        end
      rescue Errno::ENOENT => ex
        case ARGV.size()
          when 1
            puts "yaml config file #{@config_file} not there! - " + ex.message
            exit
          else
            ARGV[0] = nil
        end
      rescue IOError => ex
        puts "impossible to open yaml config file #{@config_file}! - " + ex.message
        raise ex
      rescue Exception => ex
        puts ex.message
        raise ex
      ensure
          config = {:general_settings => nil, :logger_settings => nil, :selenium_settings => nil} unless config
          general_settings = {:gs_profile_sleep_in_seconds =>nil, :gs_profile_id =>nil,
                              :gs_typing_sleep_in_seconds =>nil, :gs_max_number_of_profiles =>nil} unless general_settings
          logger_settings = {:ls_device =>nil, :ls_level =>nil,
                             :ls_shift_age =>nil, :ls_shift_size =>nil,
                             :ls_datetime_format =>nil} unless logger_settings
          selenium_settings = {:ss_selenium_port =>nil, :ss_wait_for_page_to_load =>nil,
                               :ss_timeout_in_seconds =>nil, :ss_io_device =>nil,
                               :ss_output_level =>nil, :ss_browser_type =>nil} unless selenium_settings
          database_settings = {:ds_engine_type =>nil, :ds_conn_user =>nil,
                               :ds_conn_pwd =>nil, :ds_db_host =>nil, 
                               :ds_db_driver =>nil, :ds_db_monitor =>nil, :ds_db_target =>nil} unless database_settings
          app_settings = {:as_rate_date =>nil, :as_company_id =>nil, :as_company_group_id =>nil,
                          :as_rate_id =>nil, :as_provider_id =>nil, :as_sector_id =>nil,
                          :as_working_set_id =>nil} unless app_settings
      end

      @sleep_typing					        = ARGV[6] || general_settings['gs_typing_sleep_in_seconds'] || 1
      @sleep_between_profiles       = ARGV[8] || general_settings['gs_profile_sleep_in_seconds'] || "10" # sleep in seconds between one profile execution and the next
      @max_profiles                 = ARGV[9] || general_settings['gs_max_number_of_profiles'] || "1" # max number of profiles to execute in the running task
      @profile                    	= ARGV[0] || general_settings['gs_profile_id'] || "100"

      @company_group     			      = ARGV[23] || app_settings['as_company_group_id'] || "all_provider_1"
      @company 	        			      = ARGV[1] || app_settings['as_company_id'] || "quixa"
      @provider 	        			    = ARGV[20] || app_settings['as_provider_id'] || "quixa"
      @sector 				              = ARGV[21] || app_settings['as_sector_id'] || "sect_1"
      @working_set 	         			  = ARGV[22] || app_settings['as_working_set_id'] || "prov_1_20100201"
      @rate	                        = ARGV[7] || app_settings['as_rate_id'] || "today"
      @start_date                    = ARGV[19] || app_settings['as_rate_date'] || '10th day next month'
      @rate_date                    = Chronic.parse(@start_date)

      @log_device                   = ARGV[12] || logger_settings['ls_device'] || "/home/notroot/git/KTE/code/run_time/log/"
      @log_level                    = ARGV[13] || logger_settings['ls_level'] || 2
      @datetime_format              = ARGV[14] || logger_settings['ls_datetime_format'] || "%Y-%m-%d %H:%M:%S"
    #  shift_age = logger_settings['ls_shift_age'] || 'daily'
    #  shift_size = logger_settings['ls_shift_size'] || 1048576
      @port 				                = ARGV[2] || selenium_settings['ss_selenium_port'] || "4444"
      @selenium_io                  = ARGV[15] || selenium_settings['ss_io_device'] || STDOUT
      @selenium_out_level           = ARGV[16] || selenium_settings['ss_output_level'] || 3
      @timeout_in_sec               = ARGV[10] || selenium_settings['ss_timeout_in_seconds'] || 30
      @wait_for_page_to_load        = ARGV[11] || selenium_settings['ss_wait_for_page_to_load'] || 30000
      @browser_type 			          = ARGV[24] || selenium_settings['ss_browser_type'] || "*chrome"

      @db_host						          = ARGV[5] || database_settings['ds_db_host'] || "localhost"
      @db_conn_user                 = ARGV[17] || database_settings['ds_conn_user'] || 'kte'
      @db_conn_pwd                  = ARGV[18] || database_settings['ds_conn_pwd'] || ''

      @db_driver                    = ARGV[25] || database_settings['ds_db_driver'] || 'kte_driver'
      @db_monitor                   = ARGV[26] || database_settings['ds_db_monitor'] || 'kte_monitor'
      @db_target                    = ARGV[27] || database_settings['ds_db_target'] || 'kte_target'

      @log_device += "#{@provider}_#{@sector}_#{@company}.log" unless @log_device == STDOUT
#      @selenium_io += @provider + @sector + @company + ".run.txt" unless @selenium_io == STDOUT
    end
  end

  def start_logger

    begin
      @logger = Logger.new(@log_device) # shift_age, shift_size

      @logger.level = @log_level.to_i
      @logger.datetime_format = @datetime_format

      @logger.info(__FILE__) {"#{@company} => #{"*"*80}"}
      @logger.info(__FILE__) {"#{@company} => #{"@"*20} STARTED AT #{Time.now()}"}
      @logger.info(__FILE__) {"#{@company} => #{"@"*20} #{@company.upcase} WEB SITE"}
      @logger.info(__FILE__) {"#{@company} => #{"@"*20} PROFILE #{@profile}"}
      @logger.info(__FILE__) {"#{@company} => #{"*"*80}"}

      @logger.debug(__FILE__) {"#{@company} => config file #{@config_file} succesfully open"} if @config_file
      @logger.debug(__FILE__) {"#{@company} => Starting process ..."}

      @logger.info(__FILE__) {"#{@company} => chronic start date: #{@start_date}"}
      @logger.info(__FILE__) {"#{@company} => rate date: #{@rate_date.to_s}"}
      @logger.info(__FILE__) {"#{@company} => company: #{@company}"}
      @logger.info(__FILE__) {"#{@company} => insurance profile: #{@profile}"}
      @logger.info(__FILE__) {"#{@company} => selenium port: #{@port}"}
      @logger.info(__FILE__) {"#{@company} => db host: #{@db_host.to_s()}"}
      @logger.info(__FILE__) {"#{@company} => element sleep time: #{@sleep_typing.to_s()}"}
      @logger.info(__FILE__) {"#{@company} => sleep between profiles: #{@sleep_between_profiles.to_s()}"}
      @logger.info(__FILE__) {"#{@company} => max_profiles: #{@max_profiles.to_s()}"}
    rescue Exception => ex
      puts ex.message
      raise ex
    end
  end

  def run()

    begin

      @kte = self
      @kte.start_logger
      @logger = @kte.logger

      db_profile = db_connect(@kte.db_driver)
      profiles = count_profiles(db_profile)
      db_disconnect(db_profile)

      @kte.max_profiles = profiles if @kte.max_profiles.to_i() == 0
      @test_suite = RunTest.new(@kte)
    #  @test_suite.setup

      profiles_count = 0
      while true
        break if profiles_count.to_i() == @kte.max_profiles.to_i()

        @not_free = nil

        if is_numeric?(@kte.profile)

          @logger.warn(__FILE__) {"#{@kte.company} => profile id number outside table limits !!!"} unless @kte.profile.to_i.between?(1, profiles)
          break unless @kte.profile.to_i.between?(1, profiles)
    #      case @kte.company
          @not_free = not_free_profile?
    #      end
          if @not_free
            @logger.info(__FILE__) {"#{@kte.company} => No profile/company pair available !!!"}
            break
          else
            @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} PROFILE N. #{@kte.profile}"}
            @test_suite.run()
            profiles_count = profiles_count + 1
            @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} EXECUTED PROFILES: #{profiles_count.to_s()}"}
            @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} RECORD ID N. #{@kte.record}"}
          end
        else #il profilo assicurativo non è fissato
          from_profile = start_range(profiles)
          to_profile = end_range(profiles)
          while from_profile <= to_profile do
      #      case @kte.company
            @kte.profile = from_profile
            @logger.warn(__FILE__) {"#{@kte.company} => profile id number outside table limits !!!"} unless @kte.profile.to_i.between?(1, profiles)
            @not_free = not_free_profile?
      #      end
            unless @not_free
              @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} PROFILE N. #{@kte.profile}"}
              @test_suite.run()
              profiles_count = profiles_count + 1
              @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} EXECUTED PROFILES: #{profiles_count.to_s()}"}
              @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} RECORD ID N. #{@kte.record}"}
            end
            break if profiles_count.to_i() == @kte.max_profiles.to_i()
      #        @logger.info "Break Profili Cycle"
            from_profile += 1
            sleep @kte.sleep_between_profiles.to_i unless @not_free
          end
          if profiles_count == 0
            @logger.info(__FILE__) {"#{@kte.company} => No profile/company pair available !!!"}
            break;
          end
        end
      end

    rescue Exception => ex
      @logger.error(__FILE__) {"#{@kte.company} => ERROR - Running script abnormaly terminated: #{ex}"} if @logger

    ensure
      if @logger
        @logger.info(__FILE__) {"#{@kte.company} => #{"*"*80}"}
        @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} FINISHED AT #{Time.now()}"}
        @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} #{@kte.company.upcase} WEB SITE"}
        @logger.info(__FILE__) {"#{@kte.company} => #{"*"*80}"}
        @logger.close unless @kte.log_device == STDOUT
      end
      Test::Unit.run=true unless Test::Unit.run?

    end
  end

end
