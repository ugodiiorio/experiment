#!/usr/bin/ruby -w
require "rubygems"
require "date.rb"
require "date/format.rb"
require 'chronic'
require "check_and_go"
require "yaml"
require 'logger'

#class Logger
#require 'singleton'
#
#    include Singleton
#    @@old_initialize = Logger.instance_method :initialize
#
#    def initialize
#        @@old_initialize.bind(self).call("quixa.log")
#    end
#end

begin
@@logger = nil

  begin
    
    case ARGV.size()
    when 0, 1
      config_file = ARGV[0]
      config_file = 'config.yml' unless ARGV[0]
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
      general_settings = {:gs_input_profile =>nil, :gs_company =>nil,
                          :gs_selenium_port =>nil, :gs_source_type =>nil, :gs_optional_range =>nil,
                          :gs_typing_sleep_in_seconds =>nil, :gs_execution_id =>nil,
                          :gs_profile_sleep_in_seconds =>nil, :gs_max_number_of_profiles =>nil} unless general_settings
      logger_settings = {:ls_device =>nil,
                         :ls_level =>nil,
                         :ls_shift_age =>nil,
                         :ls_shift_size =>nil,
                         :ls_datetime_format =>nil} unless logger_settings
      selenium_settings = {:ss_wait_for_page_to_load =>nil,
                           :ss_timeout_in_seconds =>nil,
                           :ss_io_device =>nil,
                           :ss_output_level =>nil} unless selenium_settings
      database_settings = {:ds_engine_type =>nil, :ds_conn_user =>nil,
                           :ds_conn_pwd =>nil, :ds_db_host =>nil, :ds_db_default =>nil} unless database_settings
      app_settings = {:as_detection_date =>nil} unless app_settings
  end

  @profilo_assicurativo_input 	= ARGV[0] || general_settings['gs_input_profile'] || "100"
  @compagnia_input 				      = ARGV[1] || general_settings['gs_company'] || "quixa"
  @port 							          = ARGV[2] || general_settings['gs_selenium_port'] || "4444"
  $source 						          = ARGV[3] || general_settings['gs_source_type'] || "216"
  $range 							          = ARGV[4] || general_settings['gs_optional_range'] || ""
  $sleep_input					         = ARGV[6] || general_settings['gs_typing_sleep_in_seconds'] || "1"
  $rilevazione	  				        = ARGV[7] || general_settings['gs_execution_id'] || "99"
  $sleep_profilo                  = ARGV[8] || general_settings['gs_profile_sleep_in_seconds'] || "10" # sleep in seconds between one profile execution and the next
  $max_profili                    = ARGV[9] || general_settings['gs_max_number_of_profiles'] || "1" # max number of profiles to execute in the running task

  $timeout_in_seconds            = ARGV[10] || selenium_settings['ss_timeout_in_seconds'] || 30
  $wait_for_page_to_load          = ARGV[11] || selenium_settings['ss_wait_for_page_to_load'] || 30000

  log_device                     = ARGV[12] || logger_settings['ls_device'] || "./Logs/warns_errors.log"
  log_level                      = ARGV[13] || logger_settings['ls_level'] || 2
  datetime_format                = ARGV[14] || logger_settings['ls_datetime_format'] || "%Y-%m-%d %H:%M:%S"
#  shift_age = logger_settings['ls_shift_age'] || 'daily'
#  shift_size = logger_settings['ls_shift_size'] || 1048576
  $selenium_io                   = ARGV[15] || selenium_settings['ss_io_device'] || STDOUT
  $selenium_out_level             = ARGV[16] || selenium_settings['ss_output_level'] || 3

  $db_ip 							          = ARGV[5] || database_settings[':ds_db_host'] || "localhost"
  $db_conn_user                 = ARGV[17] || database_settings[':ds_conn_user'] || 'Robot'
  $db_conn_pwd                 = ARGV[18] || database_settings[':ds_conn_pwd'] || ''

  start_date                = ARGV[19] || app_settings[':as_detection_date'] || '10th day next month'
  $detection_date                    = Chronic.parse(start_date)

  #$Compagnia_file = @compagnia_input
  count_profili = 0

  begin
    @@logger = Logger.new(log_device) # shift_age, shift_size
    @@logger.level = log_level.to_i
    @@logger.datetime_format = datetime_format

    @@logger.info('init') {"config file #{config_file} succesfully open"} if config_file
    @@logger.info('init') {'Starting process ...'}

    @@logger.info('init => ' + @compagnia_input) {"chronic start date: " + start_date}
    @@logger.info('init => ' + @compagnia_input) {"detection date: " + $detection_date.to_s}
    @@logger.info('init => ' + @compagnia_input) {"compagnia: " + @compagnia_input}
    @@logger.info('init => ' + @compagnia_input) {"profilo assicurativo: " + @profilo_assicurativo_input}
    @@logger.info('init => ' + @compagnia_input) {"porta: " + @port}
    @@logger.info('init => ' + @compagnia_input) {"sorgente: " + $source.to_s()}
    @@logger.info('init => ' + @compagnia_input) {"range: " + $range.to_s()}
    @@logger.info('init => ' + @compagnia_input) {"ip del database: " + $db_ip.to_s()}
    @@logger.info('init => ' + @compagnia_input) {"sleep time: " + $sleep_input.to_s()}
    @@logger.info('init => ' + @compagnia_input) {"sleep_profilo: " + $sleep_profilo.to_s()}
    @@logger.info('init => ' + @compagnia_input) {"max_profili: " + $max_profili.to_s()}
    @@logger.info('init => ' + @compagnia_input) {"count_profili: " + count_profili.to_s()}
  rescue Exception => ex
    puts ex.message
    raise ex
  end

  case $range
  when "lotto1"
    #	$range_start = 1
    #	$range_stop = 864
    $range_start = 1
    $range_stop = 400
    @@logger.info('init => ' + @compagnia_input) {"Range start: " + $range_start.to_s()}
    @@logger.info('init => ' + @compagnia_input) {"Range stop: " + $range_stop.to_s()}
  when "lotto2"
    $range_start = 865
    $range_stop = 1728
    @@logger.info('init => ' + @compagnia_input) {"Range start: " + $range_start.to_s()}
    @@logger.info('init => ' + @compagnia_input) {"Range stop: " + $range_stop.to_s()}
  when "lotto3"
    $range_start = 1729
    $range_stop = 2592
  else
    $range_start = 1
    $range_stop = 2592
  end

  cag = CheckAndGo.new()
  k = cag.profiles_number(@compagnia_input).to_i()
  if $source == "2592"
    k = $range_stop.to_i()
  end

  $max_profili = k if $max_profili.to_i() == 0
  @@logger.info('init => ' + @compagnia_input) {"max profiles: " + $max_profili.to_s()}

  while true
    break if count_profili.to_i() == $max_profili.to_i()
    @profilo_assicurativo 	= @profilo_assicurativo_input
    @compagnia 				= @compagnia_input

    chk_executed = false

    if (1 <= @profilo_assicurativo.to_i()) && (@profilo_assicurativo.to_i()<= k)

      case @compagnia    #t.to_i()
      when "all"
        @compagnia = "quixa"
        if cag.available(@compagnia, @profilo_assicurativo)
          chk_executed = true
          cag.caller(@compagnia, @profilo_assicurativo, @port)
        end
        @compagnia = "dialogo"
        if cag.available(@compagnia, @profilo_assicurativo)
          chk_executed = true
          cag.caller(@compagnia, @profilo_assicurativo, @port)
        end
        @compagnia = "directLine"
        if cag.available(@compagnia, @profilo_assicurativo)
          chk_executed = true
          cag.caller(@compagnia, @profilo_assicurativo, @port)
        end
        @compagnia = "genertel"
        if cag.available(@compagnia, @profilo_assicurativo)
          chk_executed = true
          cag.caller(@compagnia, @profilo_assicurativo, @port)
        end
        @compagnia = "genialloyd"
        if cag.available(@compagnia, @profilo_assicurativo)
          chk_executed = true
          cag.caller(@compagnia, @profilo_assicurativo, @port)
        end
        @compagnia = "linear"
        if cag.available(@compagnia, @profilo_assicurativo)
          chk_executed = true
          cag.caller(@compagnia, @profilo_assicurativo, @port)
        end
        @compagnia = "zurich"
        if cag.available(@compagnia, @profilo_assicurativo)
          chk_executed = true
          cag.caller(@compagnia, @profilo_assicurativo, @port)
        end
        @compagnia = "conTe"
        if cag.available(@compagnia, @profilo_assicurativo)
          chk_executed = true
          cag.caller(@compagnia, @profilo_assicurativo, @port)
        end
      else
        if cag.available(@compagnia, @profilo_assicurativo)
          chk_executed = true
          cag.caller(@compagnia, @profilo_assicurativo, @port)
        end
      end
      if !chk_executed
        @@logger.info('init => ' + @compagnia_input) {"No profile/company pair available !!!"}
  			break
      else
        count_profili = count_profili + 1
        @@logger.info('init => ' + @compagnia_input) {"Executed profiles: "+  count_profili.to_s()}
      end
    else #il profilo assicurativo non è fissato
      i = $range_start.to_i()
      while i <= k do
        chk_executed = false
        @profilo_assicurativo = i
        @profilo_assicurativo = @profilo_assicurativo.to_s()
        cag = CheckAndGo.new()
        #fissato il profilo
        case @compagnia
        when "all"
          @compagnia = "quixa"
          if cag.available(@compagnia, @profilo_assicurativo)
            chk_executed = true
            cag.caller(@compagnia, @profilo_assicurativo, @port)
          end
          @compagnia = "dialogo"
          if cag.available(@compagnia, @profilo_assicurativo)
            chk_executed = true
            cag.caller(@compagnia, @profilo_assicurativo, @port)
          end
          @compagnia = "directLine"
          if cag.available(@compagnia, @profilo_assicurativo)
            chk_executed = true
            cag.caller(@compagnia, @profilo_assicurativo, @port)
          end
          @compagnia = "genertel"
          if cag.available(@compagnia, @profilo_assicurativo)
            chk_executed = true
            cag.caller(@compagnia, @profilo_assicurativo, @port)
          end
          @compagnia = "genialloyd"
          if cag.available(@compagnia, @profilo_assicurativo)
            chk_executed = true
            cag.caller(@compagnia, @profilo_assicurativo, @port)
          end
          @compagnia = "linear"
          if cag.available(@compagnia, @profilo_assicurativo)
            chk_executed = true
            cag.caller(@compagnia, @profilo_assicurativo, @port)
          end
          @compagnia = "zurich"
          if cag.available(@compagnia, @profilo_assicurativo)
            chk_executed = true
            cag.caller(@compagnia, @profilo_assicurativo, @port)
          end
          @compagnia = "conTe"
          if cag.available(@compagnia, @profilo_assicurativo)
            chk_executed = true
            cag.caller(@compagnia, @profilo_assicurativo, @port)
          end
        else
          if cag.available(@compagnia, @profilo_assicurativo)
            chk_executed = true
            cag.caller(@compagnia, @profilo_assicurativo, @port)
          end
        end
        if chk_executed
          count_profili = count_profili + 1
          @@logger.info('init => ' + @compagnia_input) {"Executed profiles: "+  count_profili.to_s()}
        end
        break if count_profili.to_i() == $max_profili.to_i()
#        @@logger.info "Break Profili Cycle"
        sleep $sleep_profilo.to_i if chk_executed

        i = i+1
      end
      if !chk_executed
        @@logger.info('init => ' + @compagnia_input) {"Nessuna combinazione profilo/compagnia disponibile !!!"}
        break;
      end
    end
  end

rescue Exception => ex
  @@logger.error("init => #{@compagnia_input}") {"ERROR - Running script abnormaly terminated"} if @@logger

ensure
  Test::Unit.run=true unless Test::Unit.run?
  @@logger.close unless log_device == STDOUT if @@logger
  puts "end of init script"
end
