#!/usr/bin/ruby -w
#!/usr/bin/env ruby
$LOAD_PATH << './builders/schemas/script'

require "rubygems"
require "mysql"
require 'logger'
require "driver_schema.rb"
require "monitor_schema.rb"
require "target_schema.rb"

def init()

  puts "start of schemas building script"
  @logger = nil
  @dbh = nil
  @start_time = DateTime.now()
  puts @start_time

  begin
    case ARGV.size()
    when 0, 1
      @config_file = ARGV[0]
      @config_file = __FILE__+'.yml' unless ARGV[0] # use .foo ext to run with foo data or remove it to run app data
      File.open(@config_file)
      config = YAML::load(File.open(@config_file))
      app_settings = config['app_settings']
      database_settings = config['database_settings']
      logger_settings = config['logger_settings']
      logger_settings['ls_device'] = STDOUT if logger_settings['ls_device'] == 'STDOUT'
      ARGV[0] = nil
    end
  rescue Errno::ENOENT => ex
#    case ARGV.size()
#      when 1
        puts "yaml config file #{@config_file} not there! - " + ex.message
        raise ex
#      else
#        ARGV[0] = nil
#    end
  rescue IOError => ex
    puts "impossible to open yaml config file #{@config_file}! - " + ex.message
    raise ex
  rescue Exception => ex
    puts ex.message
    raise ex
  ensure
    config = {:app_settings => nil, :logger_settings => nil, :selenium_settings => nil} unless config
    app_settings = {:as_building_schema =>nil} unless app_settings
    logger_settings = {:ls_device =>nil,
                       :ls_level =>nil,
                       :ls_shift_age =>nil,
                       :ls_shift_size =>nil,
                       :ls_datetime_format =>nil} unless logger_settings
    database_settings = {:ds_engine_type =>nil, :ds_db_host =>nil,
                        :ds_conn_user =>nil, :ds_db_default =>nil,
                        :ds_conn_pwd =>nil} unless database_settings
  end

  @db_host	= database_settings['ds_db_host'] || "localhost"
  @db_user = database_settings['ds_conn_user'] || "testuser"
  @db_pwd = database_settings['ds_conn_pwd'] || "testpass"
  @db_default_target = database_settings['ds_db_default_target'] || "kte_target"
  @db_default_monitor = database_settings['ds_db_default_monitor'] || "kte_monitor"
  @db_default_driver = database_settings['ds_db_default_driver'] || "kte_driver"
  @schema = app_settings['as_building_schema'] || "all"

  @log_device = logger_settings['ls_device'] || "/home/notroot/git/piper_nigrum/builders/log/schemas.log"
  @log_level = logger_settings['ls_level'] || 2
  @datetime_format = logger_settings['ls_datetime_format'] || "%Y-%m-%d %H:%M:%S"

end

def start_log()

  @logger = Logger.new(@log_device) # shift_age, shift_size
  @logger.level = @log_level.to_i
  @logger.datetime_format = @datetime_format

  @logger.info('start_log') {'Starting process ...'}
  @logger.info('start_log') {"yaml config file #{@config_file} succesfully open"} if @config_file

end

def connect()

  # connect to the MySQL server
#  @dbh = Mysql.real_connect(@db_host, @db_user, @db_pwd, @db_default)
  @dbh = Mysql.real_connect(@db_host, @db_user, @db_pwd)
  # get server version string and display it
  puts "Server version: " + @dbh.get_server_info

end

def disconnect
  # disconnect from server
   @dbh.close if @dbh
   @dbh = nil unless @dbh
end

def stop_log()

  @logger.info('stop_log') {'Finishing process ...'} if @logger
  @logger.close unless @log_device == STDOUT if @logger
  @logger = nil if @logger

end

begin

  init()

  start_log()

  connect()

  case @schema
  when "driver"
    c = BuildDriverSchema.new(@db_host, @db_user, @db_pwd, @db_default_driver)
    c.run
  when "monitor"
    c = BuildMonitorSchema.new(@db_host, @db_user, @db_pwd, @db_default_monitor)
    c.run
  when "target"
    c = BuildTargetSchema.new(@db_host, @db_user, @db_pwd,  @db_default_target)
    c.run
  else
    c = BuildTargetSchema.new(@db_host, @db_user, @db_pwd,  @db_default_target)
    c.run
    c = BuildMonitorSchema.new(@db_host, @db_user, @db_pwd, @db_default_monitor)
    c.run
    c = BuildDriverSchema.new(@db_host, @db_user, @db_pwd, @db_default_driver)
    c.run
  end

  disconnect()

  stop_log()

rescue Mysql::Error => e
  @logger.error(__FILE__) {"Error code: #{e.errno}"}
  @logger.error(__FILE__) {"Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")}
  @logger.error(__FILE__) {"Error message: #{e.error}"}
rescue Exception => e
  @logger.error(__FILE__) {"Error message: #{e.message}"} if @logger
ensure
  disconnect()
  stop_log()
  puts DateTime.now()
  e ? puts("end of build_profile script with errors") : puts("end of build_profile script")

end
