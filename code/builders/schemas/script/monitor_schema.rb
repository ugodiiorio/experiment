#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module

class BuildMonitorSchema

  def initialize(db_host, db_user, db_pwd, db_default_monitor)
    @db_host = db_host
    @db_user = db_user
    @db_pwd = db_pwd
    @db_default_monitor = db_default_monitor
  end

	def run()
		
    puts "\nLa attivita' di creazione tabelle dello schema monitor su host: "+ @db_host +" e' stata inizializzata..."

    mysql = Mysql.init()
    mysql = Mysql.real_connect(@db_host, @db_user, @db_pwd)


    mysql.query("CREATE SCHEMA IF NOT EXISTS " + @db_default_monitor + "
    ;")



    mysql.query("CREATE TABLE " + @db_default_monitor + ".scheduler (
           key_insurance_profiles_id_num 	int(5) UNSIGNED NOT NULL,
            key_provider_id_str 	VARCHAR(20) NOT NULL,
            key_sector_id_str 	VARCHAR(20)  NOT NULL,
            key_company_id_str 	VARCHAR(20)  NOT NULL,
            key_working_set_id_str 	VARCHAR(20) NOT NULL,
            result_str  varchar(10) DEFAULT NULL,
            result_message_str_str varchar(256) DEFAULT NULL,
            PRIMARY KEY (key_insurance_profiles_id_num,key_provider_id_str,key_sector_id_str,key_company_id_str,key_working_set_id_str)
            ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ;"
            )

    mysql.query("  CREATE  INDEX result_index   ON " + @db_default_monitor + ".scheduler(result_str)
    ;")

    mysql.close()


    puts "\n - " + @db_default_monitor + " schema creation tables finished"
      
  end
									
end
	



