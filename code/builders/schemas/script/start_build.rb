#!/usr/bin/ruby -w
#!/usr/bin/env ruby
$LOAD_PATH << './builders/schemas/script'

require "rubygems"
require "mysql"
require 'logger'
require "app_schema.rb"
require "schedule_schema.rb"
require "price_schema.rb"

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
  @db_default_premiums = database_settings['ds_db_default_premiums'] || "test"
  @db_default_scheduler = database_settings['ds_db_default_scheduler'] || "test"
  @db_default_app = database_settings['ds_db_default_app'] || "test"
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
  when "application"
    c = BuildAppSchema.new(@db_host, @db_user, @db_pwd, @db_default_app)
    c.run
  when "schedule"
    c = BuildScheduleSchema.new(@db_host, @db_user, @db_pwd, @db_default_scheduler)
    c.run
  when "price"
    c = BuildPriceSchema.new(@db_host, @db_user, @db_pwd,  @db_default_premiums)
    c.run
  else
    c = BuildPriceSchema.new(@db_host, @db_user, @db_pwd,  @db_default_premiums)
    c.run
    c = BuildScheduleSchema.new(@db_host, @db_user, @db_pwd, @db_default_scheduler)
    c.run
    c = BuildAppSchema.new(@db_host, @db_user, @db_pwd, @db_default_app)
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
