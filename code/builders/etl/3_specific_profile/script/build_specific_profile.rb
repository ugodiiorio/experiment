#!/usr/bin/ruby -w
#!/usr/bin/env ruby
$LOAD_PATH << './builders/etl/3_specific_profile'

require "rubygems"
require "yaml"
require "mysql"
require 'logger'
require 'chronic'
require 'active_support'
MODULE = '../modules/specific_profile.rb'
require("#{File.join(File.dirname(__FILE__))}/#{MODULE}")
Mysql::Time = 7

def init()

  puts "start of build_specific_profile script"
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
    app_settings = {:as_select_stmt_profile =>nil, :as_select_stmt_filtered_profile =>nil, :as_select_stmt_company =>nil,
                        :as_select_stmt_translated =>nil, :as_select_stmt_rules =>nil, :as_rate_date => nil,
                        :as_insert_stmt_profile =>nil, :as_update_stmt_profile => nil,
                        :as_provider_id =>nil, :as_sector_id =>nil, :as_working_set_id =>nil,
                        :as_company_group_id =>nil, :as_company_id =>nil} unless app_settings
    logger_settings = {:ls_device =>nil,
                       :ls_level =>nil,
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
  @stmt_sel_profile = app_settings['as_select_stmt_profile']
  @stmt_sel_filter_profile = app_settings['as_select_stmt_filtered_profile']
  @stmt_sel_company = app_settings['as_select_stmt_company']
  @stmt_sel_translated = app_settings['as_select_stmt_translated']
  @stmt_sel_rules = app_settings['as_select_stmt_rules']
  @provider_id = app_settings['as_provider_id']
  @sector_id = app_settings['as_sector_id']
  @company_group_id = app_settings['as_company_group_id']
  app_settings['as_company_id'].empty? ? @company_id = '%' : @company_id = app_settings['as_company_id']
  @working_set_id = app_settings['as_working_set_id']
  @rate_date = app_settings['as_rate_date']

  @log_device = logger_settings['ls_device'] || "/home/notroot/git/piper_nigrum/builders/log/etl.log"
  @log_level = logger_settings['ls_level'] || 2
  @datetime_format = logger_settings['ls_datetime_format'] || "%Y-%m-%d %H:%M:%S"

  @id_profile, @profile_num, @row_num = 0, 0, 0

end

def start_log()

  @logger = Logger.new(@log_device)
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

  @dbh.query("DROP TABLE IF EXISTS foo_company_profiles")
  @dbh.query("CREATE TABLE foo_company_profiles
             (
               key_insurance_profiles_id_num INT,
               key_provider_id_str VARCHAR(32),
               key_sector_id_str VARCHAR(32),
               key_companies_group_id_str VARCHAR(32),
               key_working_set_id_str VARCHAR(32),
               class VARCHAR(256),
               cap VARCHAR(256),
               situation VARCHAR(256),
               reg_date VARCHAR(256),
               claims VARCHAR(256),
               agreement VARCHAR(256),
               update_date TIMESTAMP,
               PRIMARY KEY  USING BTREE (key_insurance_profiles_id_num, key_provider_id_str, key_sector_id_str, key_companies_group_id_str, key_working_set_id_str)
             )
           ")

  @dbh.query("DROP TABLE IF EXISTS foo_profiles")
  @dbh.query("CREATE TABLE foo_profiles
             (
               key_insurance_profiles_id_num INT,
               key_provider_id_str VARCHAR(32),
               key_sector_id_str VARCHAR(32),
               key_companies_group_id_str VARCHAR(32),
               key_working_set_id_str VARCHAR(32),
               class VARCHAR(256),
               cap VARCHAR(256),
               situation VARCHAR(256),
               reg_date VARCHAR(256),
               claims VARCHAR(256),
               agreement VARCHAR(256),
               update_date TIMESTAMP,
               PRIMARY KEY  USING BTREE (key_insurance_profiles_id_num, key_provider_id_str, key_sector_id_str, key_companies_group_id_str, key_working_set_id_str)
             )
           ")

  @dbh.query("INSERT INTO foo_profiles (key_insurance_profiles_id_num, key_provider_id_str, key_sector_id_str, key_companies_group_id_str, key_working_set_id_str,class, cap, situation, reg_date, claims, agreement)
             VALUES
               (1,'quixa','sect_1','all_quixa','quixa_20100101','14','24033','polizza nuova','2009',0,1),
               (2,'quixa','sect_1','all_quixa','quixa_20100101','1 da più di un anno','01099','attestato','2000',5,1)
           ")


  @dbh.query("DROP TABLE IF EXISTS foo_companies")
  @dbh.query("CREATE TABLE foo_companies
             (
               group_id VARCHAR(32),
               company_id VARCHAR(32),
               PRIMARY KEY  USING BTREE (group_id, company_id)
             )
           ")

  @dbh.query("INSERT INTO foo_companies (group_id, company_id)
             VALUES
               ('all_quixa','quixa'),
               ('all_quixa','linear'),
               ('all_quixa','genertel'),
               ('all_quixa','directline')
           ")
#  puts "Number of file rows inserted: #{@dbh.affected_rows}"

  @dbh.query("DROP TABLE IF EXISTS foo_translated_fields")
  @dbh.query("CREATE TABLE foo_translated_fields
             (
               provider_id VARCHAR(32),
               sector_id VARCHAR(32),
               company_id VARCHAR(32),
               field_name VARCHAR(64),
               field_value VARCHAR(256),
               target_value VARCHAR(256),
               PRIMARY KEY  USING BTREE (provider_id, sector_id, company_id, field_name, field_value)
             )
           ")

  @dbh.query("INSERT INTO foo_translated_fields (provider_id, sector_id, company_id, field_name, field_value, target_value)
             VALUES
               ('quixa','sect_1','quixa','class', '14', 'quattordici'),
               ('quixa','sect_1','quixa','situation', 'polizza nuova', 'auto nuova'),
               ('quixa','sect_1','quixa','reg_date', '2009', 'gennaio 2009'),
               ('quixa','sect_1','quixa','claims', '0', 'nessuno'),
               ('quixa','sect_1','quixa','agreement', '1', 'sì'),
               ('quixa','sect_1','quixa','class', '1 da più di un anno', 'A1'),
               ('quixa','sect_1','quixa','situation', 'attestato', 'auto usata'),
               ('quixa','sect_1','quixa','reg_date', '2000', '01-01-2000'),
               ('quixa','sect_1','quixa','claims', '5', 'più di 3'),
               ('quixa','sect_1','linear','class', '14', '10+4'),
               ('quixa','sect_1','linear','situation', 'polizza nuova', 'nuovo assicurato'),
               ('quixa','sect_1','linear','reg_date', '2009', '01-01-2009'),
               ('quixa','sect_1','linear','claims', '0', 'no'),
               ('quixa','sect_1','linear','agreement', '1', 'ko'),
               ('quixa','sect_1','linear','class', '1 da più di un anno', '1 più anni'),
               ('quixa','sect_1','linear','situation', 'attestato', 'già assicurato'),
               ('quixa','sect_1','linear','reg_date', '2000', 'gennaio duemila'),
               ('quixa','sect_1','linear','claims', '5', '> 3')
           ")

  @dbh.query("DROP TABLE IF EXISTS foo_translate_rules")
  @dbh.query("CREATE TABLE foo_translate_rules
             (
               provider_id VARCHAR(32),
               sector_id VARCHAR(32),
               company_id VARCHAR(32),
               field_name_str VARCHAR(64),
               rule_str VARCHAR(256),
               PRIMARY KEY  USING BTREE (provider_id, sector_id, company_id,field_name_str)
             )
           ")

  @dbh.query("INSERT INTO foo_translate_rules (provider_id, sector_id, company_id,field_name_str,rule_str)
             VALUES
               ('quixa','sect_1','quixa','class','translate_field'),
               ('quixa','sect_1','quixa','situation','translate_field(:class)'),
               ('quixa','sect_1','quixa','reg_date','translate_field'),
               ('quixa','sect_1','quixa','cap','copy_field'),
               ('quixa','sect_1','quixa','claims','translate_field'),
               ('quixa','sect_1','quixa','agreement','translate_field'),
               ('quixa','sect_1','linear','class','translate_field(:situation)'),
               ('quixa','sect_1','linear','situation','translate_field'),
               ('quixa','sect_1','linear','reg_date','translate_field'),
               ('quixa','sect_1','linear','cap','copy_field(:claims)'),
               ('quixa','sect_1','linear','claims','exp = profilefield[:claims].to_i + profilefield[:cap].to_i; calculate_field(exp)'),
               ('quixa','sect_1','linear','agreement','translate_field')
           ")

  #  puts "Number of mapping rows inserted: #{@dbh.affected_rows}"

end

def get_column_info()

  stmt = @stmt_sel_profile 
  @fieldname = {}
  @dbh.query_with_result = false
  @dbh.query(stmt)
  res = @dbh.use_result

  res.fetch_fields.each_with_index do |info, i|
    info.is_pri_key? ? nil : (info.type == Mysql::Time ? nil : @fieldname = @fieldname.merge({i => info.name}))
#     puts info.class
#     printf "--- Column %d (%s) ---\n", i, info.name
#     puts info.is_pri_key?
#     puts @fieldname[i]
    end
  res.free

end

def summary()
#  puts "Number of input rows parsed: #{@row_num}"
#  puts "Number of profile rows inserted: #{@profile_num}"
  puts "Number of profile rows updated: #{@profile_num}"

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

  get_column_info()

  include Specific_Profile
  build_specific_profile()

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
  e ? puts("end of build_specific_profile script with errors") : puts("end of build_specific_profile script")

end
