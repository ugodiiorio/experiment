#!/usr/bin/ruby -w
$LOAD_PATH << './builders/etl/2_translation_rule'


require "rubygems"
require "date.rb"
require "date/format.rb"
#require 'chronic'
require "yaml"
require 'logger'
require "mysql"
require "active_support"

require "modules/regexp_eval"

def init()

  puts "start of build_regexp_mapping script"
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
    app_settings = {:as_select_stmt_company  =>nil,
      :as_insert_stmt_regexp =>nil,
      :as_update_stmt_regexp => nil,
      :as_provider_id =>nil,
      :as_sector_id =>nil,
      :as_companies_group_id =>nil,
      :as_working_set_id =>nil} unless app_settings
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
  @stmt_sel_company = app_settings['as_select_stmt_company']
  @stmt_ins_regexp = app_settings['as_insert_stmt_regexp']
  @stmt_upd_regexp = app_settings['as_update_stmt_regexp']
  @stmt_sel_rule = app_settings['as_select_stmt_rule']
  @stmt_sel_value = app_settings['as_select_stmt_value']
# @stmt_sel_mapping = app_settings['as_select_stmt_mapping']
  @provider_id = app_settings['as_provider_id']
  @sector_id = app_settings['as_sector_id']
#  @companies_group_id = app_settings['as_companies_group_id']
  @company_id = app_settings['as_company_id']
  @working_set_id = app_settings['as_working_set_id']

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

#  stmt = @stmt_sel_rule
#  @fieldnum = {}
#  @dbh.query_with_result = false
#  @dbh.query(stmt)
#  res = @dbh.use_result
#
#  puts "Statement: #{stmt}"
#  if res.nil? then
#    puts "Statement has no result set"
#    printf "Number of rows affected: %d\n", @dbh.affected_rows
#  else
#    puts "Statement has a result set"
#    printf "Number of rows: %d\n", res.num_rows
#    printf "Number of columns: %d\n", res.num_fields
#    res.fetch_fields.each_with_index do |info, i|
#      #     puts info.class
#      printf "--- Column %d (%s) ---\n", i, info.name
#      puts info.is_pri_key?
#      @fieldnum = @fieldnum.merge({info.name.to_sym => info.is_num?})
#      puts @fieldnum[info.name.to_sym]
#    end
#    res.free
#  end

end

 def translate_fields()

  @dbh.query_with_result = true


  #select sulla companies che trova il key_companies_id_group
  stmt_companies = @dbh.prepare(@stmt_sel_company)
  stmt_companies.execute(@company_id)
  while row_company = stmt_companies.fetch do
    @companies_group_id = row_company[0]


    # select sulla translation rule che trova i campi da tradurre
    stmt_rule = @stmt_sel_rule
    stmt_rule = @dbh.prepare(@stmt_sel_rule)
    stmt_rule.execute(@provider_id, @sector_id, @company_id)
#    res_file = @dbh.query(stmt_rule)

     while row_rule = stmt_rule.fetch do
#    res_file.each_hash do |fieldtr|
      @field_name = row_rule[0]

      # per ogni campo trovato recupero i valori sulla insurance profiles
      stmt_value = @stmt_sel_value.sub("@@field_name@@", @field_name)
      stmt_val = @dbh.prepare(stmt_value)
      stmt_val.execute(@provider_id, @sector_id, @companies_group_id)
      while field_values = stmt_val.fetch do
        @field_value = field_values[0]
        fname_fvalue ={}
        fname_fvalue = fname_fvalue.merge({@field_name.to_s => @field_value.to_s})
        #recupero da targetquixa il valore target  hash=target_values

        #
        target = @target_values[fname_fvalue]
        #
        #
        #faccio la insert sulla translated_fields
        begin
          stmt_ins = @dbh.prepare(@stmt_ins_tr_field)
          stmt_ins.execute(@provider_id, @sector_id, @company_id, @field_name, @field_value)
        rescue Mysql::Error => e
          if e.errno.to_s == '1062'
          else raise e
          end
          @logger.error(__FILE__) {"Error code: #{e.errno}"}
          @logger.error(__FILE__) {"Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")}
          @logger.error(__FILE__) {"Error message: #{e.error}"}

        end


        #faccio l'update
        
        stmt_upd = @dbh.prepare(@stmt_upd_tr_field)
        stmt_upd.execute(target.to_s, @provider_id, @sector_id, @company_id, @field_name, @field_value)

       end
    end
  end

  #        stmt.close


  #  puts "Number of file rows returned: #{res_file.num_rows}"
  @row_num += res_file.num_rows.to_i
  res_file.free

end


def summary()
  puts "Number of input rows parsed: #{@row_num}"
  puts "Number of profile rows inserted: #{@profile_num}"
  stmt = @dbh.prepare(@stmt_sel_profile)
  stmt.execute
  puts "Number of profile rows updated: #{stmt.affected_rows()}"
  stmt.close

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

#  include Target_ + @company_id.to_s
  include Target_quixa
  build_hash_quixa()
  
  translate_fields()

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
