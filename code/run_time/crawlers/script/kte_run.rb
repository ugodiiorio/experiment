#!/usr/bin/ruby -w
#!/usr/bin/env ruby
$LOAD_PATH << './run_time/crawlers'

require "rubygems"
require "date.rb"
require "date/format.rb"
require 'chronic'
require "yaml"
require 'logger'
require 'sequel'

require "script/utils.rb"
require "script/run_page.rb"

def is_numeric?(n)
  Float n rescue false
end

def caller(compagnia, profilo_assicurativo, port)
  begin
    Caller.new( profilo_assicurativo, compagnia, port , $rilevazione  ).executor()
  rescue Exception => ex
    @logger.error('CheckAndGo.caller => ' + compagnia) {"Calling test execution failure"}
    raise ex
  end
end

begin
@logger = nil

  begin
    
    case ARGV.size()
    when 0, 1
      config_file = ARGV[0]
      config_file = __FILE__+'.yml' unless ARGV[0]
      File.open(config_file)
      config = YAML::load(File.open(config_file))
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
        puts "yaml config file #{config_file} not there! - " + ex.message
        exit
      else
        ARGV[0] = nil
    end
  rescue IOError => ex
    puts "impossible to open yaml config file #{config_file}! - " + ex.message
    raise ex
  rescue Exception => ex
    puts ex.message
    raise ex
  ensure
      config = {:general_settings => nil, :logger_settings => nil, :selenium_settings => nil} unless config
      general_settings = {:gs_source_type =>nil, :gs_profile_sleep_in_seconds =>nil,
                          :gs_typing_sleep_in_seconds =>nil, :gs_max_number_of_profiles =>nil} unless general_settings
      logger_settings = {:ls_device =>nil, :ls_level =>nil,
                         :ls_shift_age =>nil, :ls_shift_size =>nil,
                         :ls_datetime_format =>nil} unless logger_settings
      selenium_settings = {:ss_selenium_port =>nil, :ss_wait_for_page_to_load =>nil,
                           :ss_timeout_in_seconds =>nil, :ss_io_device =>nil,
                           :ss_output_level =>nil} unless selenium_settings
      database_settings = {:ds_engine_type =>nil, :ds_conn_user =>nil,
                           :ds_conn_pwd =>nil, :ds_db_host =>nil, :ds_db_default =>nil} unless database_settings
      app_settings = {:as_rate_date =>nil, :as_profile_id =>nil, :as_company_id =>nil,
                      :as_rate_id =>nil, :as_provider_id =>nil, :as_sector_id =>nil,
                      :as_working_set_id =>nil} unless app_settings
  end

  $source 						          = ARGV[3] || general_settings['gs_source_type'] || "216"
  $sleep_typing					        = ARGV[6] || general_settings['gs_typing_sleep_in_seconds'] || 1
  $sleep_between_profiles       = ARGV[8] || general_settings['gs_profile_sleep_in_seconds'] || "10" # sleep in seconds between one profile execution and the next
  $max_profili                  = ARGV[9] || general_settings['gs_max_number_of_profiles'] || "1" # max number of profiles to execute in the running task

  @profile                    	= ARGV[0] || app_settings['as_profile_id'] || "100"
  @company 	        			      = ARGV[1] || app_settings['as_company_id'] || "quixa"
  @provider 	        			    = ARGV[21] || app_settings['as_provider_id'] || "quixa"
  @sector 				              = ARGV[22] || app_settings['as_sector_id'] || "sect_1"
  @working_set 	         			  = ARGV[23] || app_settings['as_working_set_id'] || "prov_1_20100201"
  $rilevazione	                = ARGV[7] || app_settings['as_rate_id'] || "20991212"
  start_date                    = ARGV[20] || app_settings[':as_rate_date'] || '10th day next month'

  log_device                    = ARGV[12] || logger_settings['ls_device'] || "/home/notroot/git/KTE/code/run_time/log/"
  log_level                     = ARGV[13] || logger_settings['ls_level'] || 2
  datetime_format               = ARGV[14] || logger_settings['ls_datetime_format'] || "%Y-%m-%d %H:%M:%S"
#  shift_age = logger_settings['ls_shift_age'] || 'daily'
#  shift_size = logger_settings['ls_shift_size'] || 1048576
  @port 				                = ARGV[2] || selenium_settings['ss_selenium_port'] || "4444"
  $selenium_io                  = ARGV[15] || selenium_settings['ss_io_device'] || STDOUT
  $selenium_out_leve            = ARGV[16] || selenium_settings['ss_output_level'] || 3
  $timeout_in_sec               = ARGV[10] || selenium_settings['ss_timeout_in_seconds'] || 30
  $wait_for_page_to_load        = ARGV[11] || selenium_settings['ss_wait_for_page_to_load'] || 30000

  $db_ip 							          = ARGV[5] || database_settings['ds_db_host'] || "localhost"
  $db_conn_user                 = ARGV[17] || database_settings['ds_conn_user'] || 'Robot'
  $db_conn_pwd                  = ARGV[18] || database_settings['ds_conn_pwd'] || ''
  $db_default                   = ARGV[19] || database_settings['ds_db_default'] || ''

  $detection_date                    = Chronic.parse(start_date)

  #$Compagnia_file = @company
  count_profili = 0
  log_device += @provider + @sector + @company + ".log"
  $selenium_io += @provider + @sector + @company + ".run.txt"
  begin
    @logger = Logger.new(log_device) # shift_age, shift_size
    @logger.level = log_level.to_i
    @logger.datetime_format = datetime_format

    @logger.info('init') {"config file #{config_file} succesfully open"} if config_file
    @logger.info('init') {'Starting process ...'}

    @logger.info('init => ' + @company) {"chronic start date: " + start_date}
    @logger.info('init => ' + @company) {"detection date: " + $detection_date.to_s}
    @logger.info('init => ' + @company) {"compagnia: " + @company}
    @logger.info('init => ' + @company) {"profilo assicurativo: " + @profile}
    @logger.info('init => ' + @company) {"porta: " + @port}
    @logger.info('init => ' + @company) {"sorgente: " + $source.to_s()}
    @logger.info('init => ' + @company) {"ip del database: " + $db_ip.to_s()}
    @logger.info('init => ' + @company) {"sleep time: " + $sleep_typing.to_s()}
    @logger.info('init => ' + @company) {"sleep_profilo: " + $sleep_between_profiles.to_s()}
    @logger.info('init => ' + @company) {"max_profili: " + $max_profili.to_s()}
    @logger.info('init => ' + @company) {"count_profili: " + count_profili.to_s()}
  rescue Exception => ex
    puts ex.message
    raise ex
  end

#  cag = CheckAndGo.new()
#  k = cag.profiles_number(@company).to_i()
  DB = Sequel.mysql(:database => $db_default, :user => $db_conn_user, :password => $db_conn_pwd, :host => $db_ip, :loggers => @logger)
#  DB.loggers << @logger
  k = DB.from(:company_insurance_profiles).count
  DB.disconnect

  $max_profili = k if $max_profili.to_i() == 0
  @logger.info('init => ' + @company) {"max profiles: " + $max_profili.to_s()}

  include CheckAndGo
  while true
    break if count_profili.to_i() == $max_profili.to_i()

    @locked_profile = true

    if is_numeric?(@profile)
      
      @logger.warn('init => ' + @company) {"profile id number outside table limits !!!"} unless @profile.to_i.between?(1, k)
      break unless @profile.to_i.between?(1, k)
#      case @company
      unless locked_profile?
        @locked_profile = false
        caller(@company, @profile, @port)
      end
#      end
      if @locked_profile
        @logger.info('init => ' + @company) {"No profile/company pair available !!!"}
  			break
      else
        count_profili = count_profili + 1
        @logger.info('init => ' + @company) {"Executed profiles: "+  count_profili.to_s()}
      end
    else #il profilo assicurativo non è fissato
      i = 1
      while i <= k do
        chk_executed = false
        @profile = i
        @profile = @profile.to_s()
        cag = CheckAndGo.new()
        #fissato il profilo
#        case @company
          if cag.available(@company, @profile)
            chk_executed = true
            cag.caller(@company, @profile, @port)
          end
#        end
        if chk_executed
          count_profili = count_profili + 1
          @logger.info('init => ' + @company) {"Executed profiles: "+  count_profili.to_s()}
        end
        break if count_profili.to_i() == $max_profili.to_i()
#        @logger.info "Break Profili Cycle"
        sleep $sleep_between_profiles.to_i if chk_executed

        i = i+1
      end
      if !chk_executed
        @logger.info('init => ' + @company) {"Nessuna combinazione profilo/compagnia disponibile !!!"}
        break;
      end
    end
  end

rescue Exception => ex
  @logger.error("init => #{@company}") {"ERROR - Running script abnormaly terminated: #{ex}"} if @logger

ensure
  Test::Unit.run=true unless Test::Unit.run?
  @logger.close unless log_device == STDOUT if @logger
  puts "end of init script"
end
