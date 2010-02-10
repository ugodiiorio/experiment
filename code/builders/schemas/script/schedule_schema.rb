#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module

class BuildScheduleSchema

  def initialize(db_host, db_user, db_pwd, db_default)
    @db_host = db_host
    @db_user = db_user
    @db_pwd = db_pwd
    @db_default_scheduler = db_default
  end

	def run()
		
		puts "\nLa attivita' di creazione tabelle dello schema scheduler su host: "+ @db_host +" e' stata inizializzata..."
		
		mysql = Mysql.init()
		mysql = Mysql.real_connect(@db_host, @db_user, @db_pwd)


     mysql.query("CREATE SCHEMA IF NOT EXISTS " + @db_default_scheduler + "
		;")
		
		
	
			mysql.query("CREATE TABLE " + @db_default_scheduler + ".scheduler (
           key_insurance_profiles_id_num 	int(5) UNSIGNED NOT NULL,
            key_provider_id_str 	VARCHAR(20) NOT NULL,
            key_sector_id_str 	VARCHAR(20)  NOT NULL,
            key_company_id_str 	VARCHAR(20)  NOT NULL,
            key_working_set_id_str 	VARCHAR(20) NOT NULL,
            result_str  varchar(10) DEFAULT NULL,
            result_message_str_str varchar(256) DEFAULT NULL,
            PRIMARY KEY (key_insurance_profiles_id_num,key_provider_id_str,key_sector_id_str,key_company_id_str,key_working_set_id_str)
            );"
            )

   
    
					mysql.close()


    	puts "\n - " + @db_default_scheduler + " table creation finished"
      
		end
									
#	puts "\n - " + @db_default_scheduler + " table creation finished"
	
	end
	



