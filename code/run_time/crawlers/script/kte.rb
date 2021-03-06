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
KO = 'FREE'
NOT_KO = 'NOT_FREE'

require("#{File.join(DLN_LIBRARY_PATH)}/#{DB_SETTERS}")
require("#{File.join(DLN_LIBRARY_PATH)}/#{EXTENSIONS}")
require("#{File.join(File.dirname(__FILE__))}/#{TEST_SUITE}")
include DbSetters
include KteExt

class KTE
  attr_reader :logger, :company_group, :company, :provider, :sector, :working_set, :rate, :rate_date
  attr_reader :log_device, :log_level
  attr_reader :use_case, :store_params, :filter_state
  attr_reader :port, :selenium_host, :wait_for_page_to_load, :timeout_in_sec, :browser_type
  attr_reader :db_host, :db_port, :db_socket, :db_conn_user, :db_conn_pwd, :db_driver, :db_monitor, :db_target
  attr_accessor :profile, :record, :rc_cover_code, :rc_premium, :test_result
  attr_accessor :car_make, :car_model, :car_preparation, :job
  attr_accessor :max_profiles, :sleep_typing, :sleep_between_profiles

  def initialize(yaml = nil)
    begin
      @logger = nil
      @rc_premium, @rc_cover_code, @record, @test_result = 0, nil, nil, nil

      begin

        case ARGV.size()
        when 0, 1
          if yaml
            @config_file = yaml
          else
            @config_file = ARGV[0]
            @config_file = __FILE__+'.yml' unless ARGV[0]
          end
          puts @config_file
          File.open(@config_file)
          config = YAML::load(File.open(@config_file))
          general_settings = config['general_settings']
          logger_settings = config['logger_settings']
          selenium_settings = config['selenium_settings']
          database_settings = config['database_settings']
          app_settings = config['app_settings']

          logger_settings['ls_device'] = STDOUT if logger_settings['ls_device'] == 'STDOUT'
#          selenium_settings['ss_io_device'] = STDOUT if selenium_settings['ss_io_device'] == 'STDOUT'
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
                              :gs_use_case =>nil, :gs_store_params =>nil, :gs_filter_state =>nil,
                              :gs_typing_sleep_in_seconds =>nil, :gs_max_number_of_profiles =>nil} unless general_settings
          logger_settings = {:ls_device =>nil, :ls_level =>nil,
                             :ls_shift_age =>nil, :ls_shift_size =>nil,
                             :ls_datetime_format =>nil} unless logger_settings
          selenium_settings = {:ss_selenium_port =>nil, :ss_selenium_host =>nil, :ss_wait_for_page_to_load =>nil,
                               :ss_timeout_in_seconds =>nil, :ss_io_device =>nil,
                               :ss_output_level =>nil, :ss_browser_type =>nil} unless selenium_settings
          database_settings = {:ds_engine_type =>nil, :ds_conn_user =>nil, :ds_db_port =>nil,
                               :ds_conn_pwd =>nil, :ds_db_host =>nil, :ds_db_socket => nil,
                               :ds_db_driver =>nil, :ds_db_monitor =>nil, :ds_db_target =>nil} unless database_settings
          app_settings = {:as_rate_date =>nil, :as_company_id =>nil, :as_company_group_id =>nil,
                          :as_rate_id =>nil, :as_provider_id =>nil, :as_sector_id =>nil,
                          :as_working_set_id =>nil} unless app_settings
      end

      @car_make, @car_model, @car_preparation, @job = '', '', '', ''
      @sleep_typing					        = ARGV[6]  || general_settings['gs_typing_sleep_in_seconds'] || 2
      @sleep_between_profiles       = ARGV[8]  || general_settings['gs_profile_sleep_in_seconds'] || "60" # sleep in seconds between one profile execution and the next
      @max_profiles                 = ARGV[9]  || general_settings['gs_max_number_of_profiles'] || "1" # max number of profiles to execute in the running task
      @profile                    	= ARGV[0]  || general_settings['gs_profile_id'] || "1"
      @use_case                     = ARGV[28] || general_settings['gs_use_case'] || ''
      @store_params                 = ARGV[29] || general_settings['gs_store_params'] || true
      @filter_state                 = ARGV[32] || general_settings['gs_filter_state'] || ''

      @company_group     			      = ARGV[23] || app_settings['as_company_group_id']
      @company 	        			      = ARGV[1]  || app_settings['as_company_id']
      @provider 	        			    = ARGV[20] || app_settings['as_provider_id']
      @sector 				              = ARGV[21] || app_settings['as_sector_id']
      @working_set 	         			  = ARGV[22] || app_settings['as_working_set_id']
      @rate	                        = ARGV[7]  || app_settings['as_rate_id']
      @start_date                   = ARGV[19] || app_settings['as_rate_date']
      @rate_date                    = Chronic.parse(@start_date)

      @log_device                   = ARGV[12] || logger_settings['ls_device']
      @log_level                    = ARGV[13] || logger_settings['ls_level'] || 2
      @datetime_format              = ARGV[14] || logger_settings['ls_datetime_format'] || "%Y-%m-%d %H:%M:%S"
      @port 				                = ARGV[2]  || selenium_settings['ss_selenium_port'] || "4444"
      @selenium_host                = ARGV[30] || selenium_settings['ss_selenium_host'] || "localhost"
#      @selenium_io                  = ARGV[15] || selenium_settings['ss_io_device'] || STDOUT
      @selenium_out_level           = ARGV[16] || selenium_settings['ss_output_level'] || 3
      @timeout_in_sec               = ARGV[10] || selenium_settings['ss_timeout_in_seconds'] || 60
      @wait_for_page_to_load        = ARGV[11] || selenium_settings['ss_wait_for_page_to_load'] || 120000
      @browser_type 			          = ARGV[24] || selenium_settings['ss_browser_type'] || "*chrome"

      @db_host						          = ARGV[5]  || database_settings['ds_db_host'] || "localhost"
      @db_port  						        = ARGV[32] || database_settings['ds_db_port'] || 3306
      @db_socket						        = ARGV[31] || database_settings['ds_db_socket'] || ""
      @db_conn_user                 = ARGV[17] || database_settings['ds_conn_user'] || 'kte'
      @db_conn_pwd                  = ARGV[18] || database_settings['ds_conn_pwd'] || ''

      @db_driver                    = ARGV[25] || database_settings['ds_db_driver'] || 'kte_driver'
      @db_monitor                   = ARGV[26] || database_settings['ds_db_monitor'] || 'kte_monitor'
      @db_target                    = ARGV[27] || database_settings['ds_db_target'] || 'kte_target'

      case @use_case.empty?
        when true
          @log_device += "#{@provider}_#{@sector}_#{@company}.log" unless @log_device == STDOUT
        else
          @log_device += "#{@provider}_#{@use_case}.log" unless @log_device == STDOUT
      end
#      @selenium_io += @provider + @sector + @company + ".run.txt" unless @selenium_io == STDOUT
    end
  end

  def start_logger

    begin
      @logger = Logger.new(@log_device) 

      @logger.level = @log_level.to_i
      @logger.datetime_format = @datetime_format

      @logger.debug(__FILE__) {"#{@company} => config file #{@config_file} succesfully open"} if @config_file
      @logger.debug(__FILE__) {"#{@company} => Starting process ..."}

      @logger.info(__FILE__) {"#{@company} => #{"*"*80}"}

      @logger.warn(__FILE__) {"#{@company} => #{"@"*20} STARTED AT #{Time.now()}"}
      @logger.warn(__FILE__) {"#{@company} => #{"@"*20} #{@company.upcase} WEB SITE"}
      @logger.warn(__FILE__) {"#{@company} => #{"@"*20} PROFILE #{@profile}"}
      @logger.warn(__FILE__) {"#{@company} => MAX RUNNING PROFILES => [#{@max_profiles.to_s()}]"}
      @logger.warn(__FILE__) {"#{@company} => chronic start date: #{@start_date}"}
      @logger.warn(__FILE__) {"#{@company} => rate date: #{@rate_date.to_s}"}

      @logger.info(__FILE__) {"#{@company} => company: #{@company}"}
      @logger.info(__FILE__) {"#{@company} => selenium port: #{@port}"}
      @logger.info(__FILE__) {"#{@company} => db host: #{@db_host.to_s()}"}
      @logger.info(__FILE__) {"#{@company} => element sleep time: #{@sleep_typing.to_s()}"}
      @logger.info(__FILE__) {"#{@company} => sleep between profiles: #{@sleep_between_profiles.to_s()}"}

      @logger.info(__FILE__) {"#{@company} => #{"*"*80}"}
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
      @logger.warn(__FILE__) {"#{@kte.company} => #{"@"*20} RUNNING PROFILES => [#{@kte.max_profiles}]"}

      profiles_count = 0
      while true
        break if profiles_count.to_i() == @kte.max_profiles.to_i()

        @not_free, @filtered_out = nil, nil

        if is_numeric?(@kte.profile)

          @logger.warn(__FILE__) {"#{@kte.company} => profile id number outside table limits !!!"} unless @kte.profile.to_i.between?(1, profiles)
          break unless @kte.profile.to_i.between?(1, profiles)
          @not_free = not_free_profile?
          if @not_free
            @logger.warn(__FILE__) {"#{@kte.company} => No profile/company pair available !!!"}
            break
          else
            @logger.warn(__FILE__) {"#{@kte.company} => #{"@"*20} PROFILE N. #{@kte.profile}"}
            test_suite = RunTest.new(@kte)
            test_suite.run()
            test_suite = nil
            profiles_count = profiles_count + 1
            @logger.warn(__FILE__) {"#{@kte.company} => #{"@"*20} EXECUTED PROFILES: #{profiles_count.to_s()}"}
            @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} RECORD ID N. #{@kte.record}"}
          end
        else # not predefined profile
          from_profile = start_range(profiles)
          to_profile = end_range(profiles)
          while from_profile <= to_profile do
      #      case @kte.company
            @profile_array.size > 1 ? @kte.profile = @profile_array[from_profile] : @kte.profile = from_profile
            @logger.warn(__FILE__) {"#{@kte.company} => profile id number outside table limits !!!"} unless @kte.profile.to_i.between?(1, profiles)

            case @filter_state.empty?
              when true
                @filtered_out = false
              when false
                db_profile = db_connect(@kte.db_monitor)
                (check_state(db_profile, 'FREE') > 0 ? @filtered_out = false : @filtered_out = true; @not_free = true) if @filter_state == KO
                (check_state(db_profile, 'FREE') == 0 ? @filtered_out = false : @filtered_out = true; @not_free = true) if @filter_state == NOT_KO
                db_disconnect(db_profile)
              else
            end

            @not_free = not_free_profile? unless @filtered_out
      #      end
            unless @not_free
              @logger.warn(__FILE__) {"#{@kte.company} => #{"@"*20} PROFILE N. #{@kte.profile}"}
              test_suite = RunTest.new(@kte)
              test_suite.run()
              test_suite = nil
              profiles_count = profiles_count + 1
              @logger.warn(__FILE__) {"#{@kte.company} => #{"@"*20} EXECUTED PROFILES: #{profiles_count.to_s()}"}
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
        @logger.warn(__FILE__) {"#{@kte.company} => #{"@"*20} FINISHED AT #{Time.now()}"}
        @logger.info(__FILE__) {"#{@kte.company} => #{"@"*20} #{@kte.company.upcase} WEB SITE"}
        @logger.info(__FILE__) {"#{@kte.company} => #{"*"*80}"}
        @logger.close unless @kte.log_device == STDOUT
      end
      @kte = nil
      Test::Unit.run=true unless Test::Unit.run?

    end
  end

end
