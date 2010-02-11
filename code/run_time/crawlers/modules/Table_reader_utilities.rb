#!/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module
require "rubygems"
require "mysql"

class Table_reader_utilities

	def Num_column_profiles(profilo_assicurativo)
		mysql = Mysql.init()
		mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_technical")
		
		profilo_assicurativo = profilo_assicurativo.to_s()
		
		res = mysql.query("SELECT * FROM profili_assicurativi_" + $source + " WHERE id_profilo_assicurativo = '"+ profilo_assicurativo +"'")		
		
		return res.num_fields		
	end
	
	def Num_rows_profiles()
		mysql = Mysql.init()
		mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_technical")
		
		if $source == "216"
			res = mysql.query("Select * From profili_assicurativi_216 ")
			k = res.num_rows
		else
			k = ($range_stop-$range_start).to_s()
			
		end
		
		puts " - Numero profili da eseguire: "+ k.to_s()	
		
		return k
	end
	
	def CheckCell(column, profilo_assicurativo)
		mysql = Mysql.init()
		mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_scheduler")
		
		column = column.to_i()
		profilo_assicurativo = profilo_assicurativo.to_s()
		#compagnia_ext = "Chk_" + compagnia	
			
		res = mysql.query("SELECT * FROM scheduler_" + $source + "  WHERE id_profilo_assicurativo = '"+ profilo_assicurativo +"'")
		
		while row = res.fetch_row do
			consumer = row[column]
		  	response = row[column]
		end
		
		case response.to_s
		when ""
			puts "Cell State: EMPTY "
		when "OK"
			puts "Cell State: "+ response.to_s()
		when "KO"
			puts "Cell State: "+ response.to_s()
		when "LOCKED"
			puts "Cell State: "+ response.to_s()
		else
			puts "Cell State: ERROR"
		end	
		
		return response.to_s()		
	end
	
end

