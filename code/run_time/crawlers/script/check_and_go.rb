require "caller.rb"
require "Utilities/Table_reader.rb"
require "Utilities/Table_reader_constants.rb"
require "Utilities/Table_reader_utilities.rb"
require "Utilities/Table_writer.rb"

class CheckAndGo
  
	def profiles_number(company)
    begin
      $reader_util = Table_reader_utilities.new()
      return $reader_util.Num_rows_profiles().to_i()
    rescue Exception => ex
      @@logger.fatal('CheckAndGo.profiles_number => ' + company) {ex.message}
      raise
    end
	end

	def available(compagnia, profilo_assicurativo)

		k = 9
		num_comp = 8

		case compagnia.to_s
    when "conTe"
      column = k-num_comp
    when "dialogo"
      column = k-num_comp+1
    when "directLine"
      column = k-num_comp+2
    when "genertel"
      column = k-num_comp+3
    when "genialloyd"
      column = k-num_comp+4
    when "linear"
      column = k-num_comp+5
    when "quixa"
      column = k-num_comp+6
    when "zurich"
      column = k-num_comp+7
		end

		@@logger.debug('CheckAndGo.available => ' + compagnia) {"Checking availability for company "+ compagnia	+ " and profile " + profilo_assicurativo}
    begin
      response = $reader_util.CheckCell(column, profilo_assicurativo)
      if (response.to_s() == "KO") || (response.to_s() == "")
        @@logger.debug('CheckAndGo.available => ' + compagnia) {"Check profile availability PASSED"}
        return true
      else
        @@logger.debug('CheckAndGo.available => ' + compagnia) {"Check profile availability NOT PASSED"}
        return false
      end

    rescue Exception => ex
      @@logger.fatal('CheckAndGo.available => ' + compagnia) {ex.message}
      raise 
    end
	end

	def caller(compagnia, profilo_assicurativo, port)
    begin
  		Caller.new( profilo_assicurativo, compagnia, port , $rilevazione  ).executor()
    rescue Exception => ex
      @@logger.error('CheckAndGo.caller => ' + compagnia) {"Calling test execution failure"}
      raise ex
    end
	end
end
