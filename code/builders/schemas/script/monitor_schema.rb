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
            key_rate_id_str varchar(8)  NOT NULL,
            state_str  varchar(10) DEFAULT 'NOT RUN',
            result_str  varchar(10) DEFAULT NULL,
            result_message_str varchar(1024) DEFAULT NULL,
            start_update TIMESTAMP DEFAULT 0,
            last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (key_insurance_profiles_id_num,key_provider_id_str,key_sector_id_str,key_company_id_str,key_working_set_id_str,key_rate_id_str)
            ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci ;"
            )

    mysql.query("  CREATE  INDEX state_index   ON " + @db_default_monitor + ".scheduler(state_str)
    ;")

    mysql.close()


    puts "\n - " + @db_default_monitor + " schema tables creation finished"
      
  end
									
end
	



