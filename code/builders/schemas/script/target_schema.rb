#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module

class BuildTargetSchema
  
  def initialize(db_host, db_user, db_pwd, db_default_target)
    @db_host = db_host
    @db_user = db_user
    @db_pwd = db_pwd
    @db_default_target = db_default_target
  end

	def run()
		
		puts "\nLa attivita' di creazione tabelle dello schema target su host: "+ @db_host +" e' stata inizializzata..."
		
		mysql = Mysql.init()
		mysql = Mysql.real_connect(@db_host, @db_user, @db_pwd)

     mysql.query("CREATE SCHEMA IF NOT EXISTS " + @db_default_target + "
		;")

	mysql.query("CREATE TABLE " + @db_default_target + ".premiums (
            key_insurance_profiles_id_num 	int(5) UNSIGNED NOT NULL,
            key_provider_id_str 	VARCHAR(20) NOT NULL,
            key_sector_id_str 	VARCHAR(20)  NOT NULL,
            key_company_id_str 	VARCHAR(20)  NOT NULL,
            key_working_set_id_str 	VARCHAR(20) NOT NULL,
            key_cover_id_str varchar(20)  NOT NULL,
		        premium_num decimal(6,2)  NOT NULL,
            timestamp TIMESTAMP DEFAULT 0,
			       PRIMARY KEY (key_insurance_profiles_id_num,key_provider_id_str,key_sector_id_str,key_company_id_str,key_working_set_id_str,key_cover_id_str)
      	);"
    )
			
		mysql.close()

    		puts "\n - " + @db_default_target + " schema tables creation finished"
		
		end
				
		


	
	end
	
	



