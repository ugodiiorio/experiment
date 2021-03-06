#!/usr/bin/env ruby
$LOAD_PATH << './builders/etl/1_generic_profile'

require "rubygems"
require 'logger'
require "mysql"
require "yaml"

MODULE = '../modules/profile.rb'
require("#{File.join(File.dirname(__FILE__))}/#{MODULE}")

def init()

  puts "start of build_profile script"
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
    app_settings = {:as_select_stmt_mapping => nil, :as_select_stmt_input => nil,
                        :as_select_stmt_filtered_mapping => nil, :as_insert_stmt_profile => nil, :as_update_stmt_profile => nil,
                        :as_provider_id => nil, :as_sector_id => nil, :as_input_file => nil,
                        :as_company_group_id => nil, :as_working_set_id => nil, :as_provider_company_id => nil} unless app_settings
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
  @db_default = database_settings['ds_db_default'] || "test"

  @stmt_ins_profile = app_settings['as_insert_stmt_profile']
  @stmt_upd_profile = app_settings['as_update_stmt_profile']
  @stmt_sel_mapping = app_settings['as_select_stmt_mapping']
  @stmt_sel_input = app_settings['as_select_stmt_input']
  @stmt_filter_mapping = app_settings['as_select_stmt_filtered_mapping']
  @input_file = app_settings['as_provider_id'].to_s + "_" + app_settings['as_sector_id'].to_s + "_input_file"
  @provider_id = app_settings['as_provider_id']
  @sector_id = app_settings['as_sector_id']
  @company_group_id = app_settings['as_company_group_id']
  @working_set_id = app_settings['as_working_set_id']
  @provider_company_id = app_settings['as_provider_company_id']
  @log_device = logger_settings['ls_device'] || "/home/notroot/git/piper_nigrum/builders/log/etl.log"
  @log_level = logger_settings['ls_level'] || 2
  @datetime_format = logger_settings['ls_datetime_format'] || "%Y-%m-%d %H:%M:%S"

  @id, @profile_num, @row_num = 0, 0, 0

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
  @dbh = Mysql.real_connect(@db_host, @db_user, @db_pwd, @db_default)
  # get server version string and display it
  puts "Server version: " + @dbh.get_server_info

end

def create_schema()

  @dbh.query("DROP TABLE IF EXISTS profiles")
  @dbh.query("CREATE TABLE profiles
             (
               key_insurance_profiles_id_num INT,
               key_provider_id_str VARCHAR(32),
               key_sector_id_str VARCHAR(32),
               key_companies_group_id_str VARCHAR(32),
               key_working_set_id_str VARCHAR(32),
               class VARCHAR(32),
               cap VARCHAR(32),
               situation VARCHAR(32),
               reg_date VARCHAR(32),
               claims INT,
               agreement INT,
               update_date TIMESTAMP,
               PRIMARY KEY  USING BTREE (key_insurance_profiles_id_num, key_provider_id_str, key_sector_id_str, key_companies_group_id_str, key_working_set_id_str)
             )
           ")

  @dbh.query("DROP TABLE IF EXISTS file_input")
  @dbh.query("CREATE TABLE file_input
             (
               class VARCHAR(32),
               cap VARCHAR(32),
               situation VARCHAR(32),
               reg_date VARCHAR(32),
               claims INT
             )
           ")

  @dbh.query("INSERT INTO file_input (class, cap, situation, reg_date, claims)
             VALUES
               ('14','24033','polizza nuova','2009',0),
               ('7','00033','attestato di rischio','1990',1),
               ('1','20100','B/M bersani','1999',3),
               ('1 da più di un anno','01099','polizza nuova','2000',0)
           ")
#  puts "Number of file rows inserted: #{@dbh.affected_rows}"

  @dbh.query("DROP TABLE IF EXISTS mapping")
  @dbh.query("CREATE TABLE mapping
             (
               provider_id VARCHAR(32),
               sector_id VARCHAR(32),
               output_field VARCHAR(32),
               output_eval TEXT,
               PRIMARY KEY  USING BTREE (provider_id, sector_id, output_field)
             )
           ")

  @dbh.query("INSERT INTO mapping (provider_id, sector_id, output_field, output_eval)
             VALUES
               ('quixa','sect_1','class','infield[:class]'),
               ('quixa','sect_1','cap','infield[:cap]'),
               ('quixa','sect_1','situation','infield[:situation]'),
               ('quixa','sect_1','reg_date','a = infield[:reg_date].to_i; b = 20; c = a + b'),
               ('quixa','sect_1','claims','infield[:claims]'),
               ('quixa','sect_1','agreement', 1)
           ")
#  puts "Number of mapping rows inserted: #{@dbh.affected_rows}"

end

def get_column_info()

  stmt = @stmt_sel_mapping
  @fieldname = {}
  @dbh.query_with_result = false
  @dbh.query(stmt)
  res = @dbh.use_result

  res.fetch_fields.each_with_index do |info, i|
    @fieldname = @fieldname.merge({i => info.name})
#     puts info.class
#     printf "--- Column %d (%s) ---\n", i, info.name
#     puts info.is_pri_key?
#     puts @fieldname[i]
    end
  res.free

end

def summary()
  puts "Number of input rows parsed: #{@row_num}"
  puts "Number of profile rows inserted: #{@profile_num}"
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

#  create_schema() # uncomment to create and use dummy tables with foo data

  get_column_info() # not yet used

  include Profile
  build_profile()

  summary()

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
