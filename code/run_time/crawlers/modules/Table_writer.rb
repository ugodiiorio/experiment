#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module
#require "rubygems"
require "mysql"

class Writer
#	attr_accessor :profilo_Assicurativo, :compagnia, :id_test
	
	def initialize (ep)
		@profilo_assicurativo 	= ep[:profilo_assicurativo]
		@compagnia 				= ep[:compagnia]
		@id_test				= ep[:id_test].to_s()
	end
	
	def result_new ()

		@@logger.info('Writer.result_new => ' + @compagnia) {"New result insert before unit test"}
		@@logger.info('Writer.result_new => ' + @compagnia) {"Insert of id_test = " + @id_test.to_s() +
                     " on profilo_assicurativo " + @profilo_assicurativo.to_s()}

		begin
      mysql = Mysql.init()
      mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_scheduler")

      mysql.query("INSERT INTO tests_" + $source + "
          (
          id_test 					,
          Compagnia					,
          Profilo_assicurativo		,
          Timestamp_inizio			,
          Timestamp_fine				,
          Esito_test
          )

          values(
          '#{@id_test}'				,
          '#{@compagnia}'				,
          '#{@profilo_assicurativo}'	,
          CURRENT_TIMESTAMP			,
          'NOT_FINISHED'				,
          'KO'
          )
        ")

  		mysql.close()

    rescue Exception => ex
      @@logger.fatal('Writer.result_new => ' + @compagnia) {ex.message}
      raise
    end
	end
	
	def result_update (result = "OK", result_message = "")

    begin
      mysql = Mysql.init()
      mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_scheduler")

      mysql.query("UPDATE tests_" + $source + " SET
        Timestamp_fine		= CURRENT_TIMESTAMP		,
        Esito_test				= '#{result}',
        result_message  	= '#{result_message.to_s.gsub("'", "*")}'
        WHERE id_test='#{@id_test}'")

      mysql.close()
    rescue Exception => ex
      @@logger.fatal('Writer.result_update => ' + @compagnia) {ex.message}
      raise
    end
		@@logger.info('Writer.result_update => ' + @compagnia) {"Result update after unit test run"}
		@@logger.info('Writer.result_update => ' + @compagnia) {"Update for id_test = " + @id_test.to_s() + " on profilo_assicurativo " + @profilo_assicurativo.to_s()}

  end
		
	def profile_price (profilo_assicurativo, compagnia, garanzia, rilevazione , premio)

    begin
      mysql = Mysql.init()
      mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_premi")

        mysql.query("INSERT INTO premi_" + $source + "
          (
          id_profilo_assicurativo 	,
          id_compagnia 				,
          id_garanzia 				,
          id_rilevazione				,
          Data						,
          Time						,
          Premio

          )

          values(
          '#{profilo_assicurativo}', 			#id_profilo_assicurativo 	,
          '#{compagnia}', 		           	#id_compagnia 				,
          '#{garanzia}', 			#id_garanzia 				,
          '#{rilevazione}', 			#id_rilevazione ,
          CURRENT_DATE,	 			#Data 			,
          CURRENT_TIME,			#time
          '#{premio}' 			#Premio						,

          )
        ")

      mysql.close()
    rescue Exception => ex
      @@logger.fatal('Writer.profile_price => ' + @compagnia) {ex.message}
      raise
    end
		@@logger.info('Writer.profile_price => ' + @compagnia) {"Profile price insert after successfully unit test"}
		@@logger.info('Writer.profile_price => ' + @compagnia) {"New price " + premio.to_s() + " for profile " + profilo_assicurativo.to_s()}

	end

end