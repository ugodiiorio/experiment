#!/usr/bin/ruby -w
$LOAD_PATH << './builders/etl/1_generic_profile'


require "rubygems"
require "date.rb"
require "date/format.rb"
require "yaml"
require 'logger'
require "mysql"
require "active_support"

#require "modules/field_mapping_provider_1_sect_1.rb"
MODULE_FOLDER = 'modules'
#puts File.dirname(__FILE__)
DLN_LIBRARY_PATH = File.join(File.dirname(__FILE__),'..',MODULE_FOLDER)

#DLN_LIBRARY_PATH << '/modules/provider_1/quixa/'
#puts DLN_LIBRARY_PATH


def init()

  puts "start of build_field_mapping script"
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
    puts "yaml config file #{@config_file} not there! - " + ex.message
    raise ex
  rescue IOError => ex
    puts "impossible to open yaml config file #{@config_file}! - " + ex.message
    raise ex
  rescue Exception => ex
    puts ex.message
    raise ex
  ensure
    config = {:app_settings => nil, :logger_settings => nil, :selenium_settings => nil} unless config
    app_settings = {:as_select_stmt_rule =>nil, :as_select_stmt_value =>nil, :as_select_stmt_company  =>nil,
      :as_insert_stmt_tr_field =>nil, :as_update_stmt_tr_field => nil,
      :as_provider_id =>nil, :as_sector_id =>nil,
      :as_companies_group_id =>nil, :as_working_set_id =>nil} unless app_settings
    logger_settings = {:ls_device =>nil,
      :ls_level =>nil,
      :ls_shift_age =>nil,
      :ls_shift_size =>nil,
      :ls_datetime_format =>nil} unless logger_settings
    database_settings = {:ds_engine_type =>nil, :ds_db_host =>nil,
      :ds_conn_user =>nil, :ds_db_default =>nil,
      :ds_conn_pwd =>nil} unless database_settings
  end

  @host	= database_settings['ds_db_host'] || "localhost"
  @db_user = database_settings['ds_conn_user'] || "testuser"
  @db_pwd = database_settings['ds_conn_pwd'] || "testpass"
  @db_default = database_settings['ds_db_default'] || "test"
  @stmt_ins_tr_rule = app_settings['as_insert_stmt_tr_rule']
  @stmt_sel_profile = app_settings['as_select_stmt_profile']
  @provider_id = app_settings['as_provider_id']
  @sector_id = app_settings['as_sector_id']

  @log_device = logger_settings['ls_device'] || "./logs/warns_errors.log"
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
  @dbh = Mysql.real_connect(@host, @db_user, @db_pwd, @db_default)
  # get server version string and display it
  puts "Server version: " + @dbh.get_server_info

end

def get_column_info()

   stmt = @stmt_sel_profile
   @dbh.query_with_result = false
   @dbh.query(stmt)
   res = @dbh.use_result
   @fieldnames = []
   res.fetch_fields.each do |info|
     #     puts info.class
   info.is_pri_key?  ? nil  : ( info.type == Mysql::Time ? nil : @fieldnames << info.name )
    
   end
   res.free

end

def do_field_mapping()

     # recupero il nome della colonna
     # per ogni campo faccio la insert sulla field_mapping
     index = 0
     while index < @fieldnames.length
       @field_name = @fieldnames[index]

       rule = @field_rule_values[@field_name]

       begin
         stmt_ins = @dbh.prepare(@stmt_ins_tr_rule)
         stmt_ins.execute(@provider_id, @sector_id, @field_name, rule, rule)
       rescue Mysql::Error => e
         if e.errno.to_s == '1062'
         else raise e
         end
         @logger.error(__FILE__) {"Error code: #{e.errno}"}
         @logger.error(__FILE__) {"Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")}
         @logger.error(__FILE__) {"Error message: #{e.error}"}
       end
       stmt_ins.close

       index += 1
     end

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

  get_column_info()

  module_name = 'field_mapping_' + @provider_id.to_s + @sector_id.to_s
  load(DLN_LIBRARY_PATH + '/' + module_name + '.rb')
  include module_name.camelize.constantize


#  path_mod = "Field_Mapping_"  +  @provider_id.to_s.capitalize  + "_" + @sector_id.to_s.capitalize

#  include  path_mod.constantize

  build_hash_field_rule()

  do_field_mapping()

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