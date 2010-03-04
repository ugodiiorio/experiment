#############################################
#   	Created by Kubepartners			          #
#                                           #
#				13/03/2009						              #
#############################################

#gem "selenium-client", ">=1.2.13"
#require "selenium/client"

module QuixaSect1 #< Test::Unit::TestCase
  
  def setup
    begin
      @@logger.info('QuixaTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Compagnia QUIXA \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

      @garanzia = "1"
      @verification_errors = []
      const_publisher

      @@logger.debug('QuixaTest.setup => ' + $compagnia) {"Selenium port: "+ $port}
      @selenium= Selenium::Client::Driver.new \
        :host => "localhost",
        :port => $port,
        :browser => $browser,
        :url => "http://www.quixa.it",
        :timeout_in_seconds => $timeout_in_sec

      @selenium.start_new_browser_session
      @selenium.set_context("test_new")
    rescue Errno::ECONNREFUSED => ex
      @@logger.error('QuixaTest.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
      raise ex
    rescue Exception => ex
#      @verification_errors[@verification_errors.size] = ex.message
      @@logger.error('QuixaTest.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
      raise ex
    end
  end
  
  def teardown
	  @selenium.close_current_browser_session #unless $selenium
    assert_equal [], @verification_errors
  end
  
  def test_new

    begin
      @last_element = nil
      #@selenium.set_speed 2000
      @selenium.open "/simulator.aspx?SimObject=CAR"
#      click "/html/body/form/div[3]/div/div[3]/div/div/map[4]/area"
#      click   "//div[@id='hidepage']/div[1]/div[3]/div[1]/div[1]/map[3]/area"  #causa promozione feltrinelli si è spostato il bottone "fai preventivo" promozione in scadenza 14&/12/2009
#      @selenium.wait_for_page_to_load $wait_for_page_to_load

    #sleep 3 #non commentare in Quixa
      select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlBrand", "label="+				$Marca_auto
    #sleep 2
      if $Polizza_nuova_auto_nuova
        type "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_txt1stPlate", 						$Data_imm_classe_14_mese + "/" + $Data_decorrenza_anno
      else
        if $Polizza_nuova_auto_usata
          type "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_txt1stPlate", 						$Data_immatricolazione
        else
          type "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_txt1stPlate", 						$Data_immatricolazione
        end
      end

      #sleep 3
      select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlModel", "label="+				$Modello_auto
        select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVersion", "label="+			$Allestimento_auto
      #sleep 5
      select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlKmPerYear", "label="+		$N_km_quixa
      select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVehicleUse", "label="+ 		$Uso_auto
      click "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward"
        #sleep 6 #non commentare in Quixa

#      wait_for_alert()

        select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlProvince", "label="+			$Provincia
      click 																															$Sesso
        type "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_txtBirthDate", 						$Data_nascita
        #sleep 3
      select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlJob", "label="+					$Professione
      #sleep 5
      if $Polizza_nuova_auto_nuova
        click "//option[@value='2']"
      else
        if $Polizza_nuova_auto_usata
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlInsuranceSituation", "label="+ "Prima Polizza dopo l'acquisto di un veicolo"
        else
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlInsuranceSituation", "label="+ $Situaziona_assicurativa
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlClassBonus", "label="+			$Classe_BM
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano1", "label="+					$N_incidenti_anno_1
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano2", "label="+					$N_incidenti_anno_2
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano3", "label="+					$N_incidenti_anno_3
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano4", "label="+					$N_incidenti_anno_4
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano5", "label="+					$N_incidenti_anno_5
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano0", "label="+					$N_incidenti_anno_0
          select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlCongenere", "label="+			$Compagnia_precedente
        end
      end
      click 																															$Flag_no_leasing
        select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlMunicipality", "label="+ 		$Comune_residenza
      select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlCountry", "label="+				$Nazione
        type "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_txtDateEffect", 						$Data_decorrenza
      click 																															$Flag_conducenti_inf_26
      click "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward"
        #sleep 3 #non commentare in Quixa

      click "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward"
        #sleep 3 #non commentare in Quixa
#      $Massimale_RCA = $Massimale_RCA + " €"
#      select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddl_P01_Max", "label="+ 			$Massimale_RCA
      select_regex "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddl_P01_Max", "label=" + $Massimale_RCA

      select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddlChargeType", "label="+ 		$Mezzo_pagamento
      click "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnReCalculation"
      sleep 3 

#      @selenium.wait_for_element "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddl_P01_Max"
#      lab = @selenium.get_selected_label "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddl_P01_Max"
#      @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
#      if (lab != $Massimale_RCA)
#        select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddl_P01_Max", "label="+ 								$Massimale_RCA
#        select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddlChargeType", "label=Carta di Credito"
#        click "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnReCalculation"
#        @selenium.wait_for_page_to_load $wait_for_page_to_load
#      end

        #premio = @selenium.get_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_lbl_P01_DA")
      wait_for_elm "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_lblVisible_DA_Prize"
      assert !60.times{ break if (@selenium.get_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_lblVisible_DA_Prize").split[0].to_s.match(/[a-zA-Z]/) == nil rescue false); sleep 1 }
      premio = @selenium.get_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_lblVisible_DA_Prize")
      raise RangeError, "Price cannot be a string" if premio.split[0].to_s.match(/[a-zA-Z]/) == nil ? false : true
      premio = premio.split[0]
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio

      @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      raise RangeError, "Price cannot be nil" unless premio
      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    rescue Timeout::Error => ex
      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('QuixaTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('QuixaTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    end
	end 
	
	def select_regex(element, label)
	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"      ...la label con regex = "+label}
	  wait_for_select(element, label, "regex")
	  @selenium.select element, label
	end

	def select(element, label)
	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element+ " la label = "+label}
	  wait_for_select(element, label)
	  @selenium.select element, label  	
	end
	
	def click(element)
	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) { "Click su elemento = "+element}
	  wait_for_elm(element)
	  @selenium.click element 	
	end  
	
	def type(element, label)
	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) { "Type su elemento = "+element+" la label = "+label}
	  wait_for_elm(element)
	  @selenium.type element, label  	
	end     
  
  def wait_for_select(nome_elemento_combo, label, regex = nil)
  	#sleep 3 #non commentare in Quixa !
#  	sleep 2
  	sleep $sleep
    @last_element = nome_elemento_combo
  	if(nome_elemento_combo==nil)
  		@@logger.error('QuixaTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
      raise RangeError, "Wait for select failed! Element cannot be nil"
  	end
    if(label==nil)
        @@logger.error('QuixaTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
      raise RangeError, "Wait for select failed! Label cannot be Elemento = nil"
      end
    label= label.gsub!("label=","")
    if(label==nil)
      @@logger.error('QuixaTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
      raise RangeError, "Wait for select failed! Label cannot be nil"
    end
	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Label = "+label}
	  wait_for_elm nome_elemento_combo
	  var = @selenium.element? nome_elemento_combo
	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }	unless regex
#	  var = @selenium.get_select_options(nome_elemento_combo).include?(label)
#    if var
#  	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Label presente nella combo = " + label}
#    else
#  	  @@logger.error('QuixaTest.test_new => ' + $compagnia) {"Label not present into combo = " + label}
#      raise RangeError, "Wait for select failed! label not present = " + label
#    end
  end
  
  def wait_for_elm(nome_elemento)
#	sleep 2
    @last_element = nome_elemento
  	sleep 1.5
#  	sleep $sleep
	  if(nome_elemento==nil)
		  @@logger.error('QuixaTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
      raise RangeError, "Wait for element failed! Element cannot be nil"
	  end	  
	  @selenium.wait_for_element nome_elemento
	  if @selenium.element? "ctl00_UpdateProgress1"
		  if @selenium.is_visible("ctl00_UpdateProgress1")
		  	assert !30.times{ break if (! @selenium.is_visible("ctl00_UpdateProgress1")); sleep 1; @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Attesa - combo "+ nome_elemento;} }
		  end
	  end
	  if @selenium.element? nome_elemento
  	  @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
    else
  	  @@logger.error('QuixaTest.test_new => ' + $compagnia) {"Element = " + nome_elemento +" not present"}
      raise RangeError, "Wait for element failed! Element not present = " + nome_elemento
    end
	  #var = @selenium.element? nome_elemento
	  #@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()+"\n\n"
  end  
  
	def wait_for_alert()
		!8.times{ break if (@selenium.alert?); sleep 1; puts "Attesa alert \n"; }
		if @selenium.alert?
			@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Consuming alert !"}
			@selenium.alert()	
		else
			@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"No alert present"}
		end
	end     
	
	def const_publisher
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Comune_residenza	 =	" +		$Comune_residenza}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Marca_auto  	 =	" +		$Marca_auto}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Modello_auto  	 =	" +		$Modello_auto}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Allestimento_auto  	 =	" +		$Allestimento_auto}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Provincia  	 =	" +		$Provincia}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Professione  	 =	" +		$Professione}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Classe_BM  	 =	" +		$Classe_BM}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Sesso	 =	" +		$Sesso}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_nascita_giorno	 =	" +		$Data_nascita_giorno}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_nascita_mese	 =	" +		$Data_nascita_mese}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_nascita_anno	 =	" +		$Data_nascita_anno}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_nascita	 =	" +		$Data_nascita}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_immatricolazione_mese	 =	" +		$Data_immatricolazione_mese}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_immatricolazione_anno	 =	" +		$Data_immatricolazione_anno}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_immatricolazione	 =	" +		$Data_immatricolazione}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_1  	 =	" +		$N_incidenti_anno_1}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_2  	 =	" +		$N_incidenti_anno_2}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_3  	 =	" +		$N_incidenti_anno_3}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_4  	 =	" +		$N_incidenti_anno_4}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_5  	 =	" +		$N_incidenti_anno_5}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_0  	 =	" +		$N_incidenti_anno_0}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Massimale_RCA  	 =	" +		$Massimale_RCA}
    @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Data_decorrenza_giorno = "+ 		$Data_decorrenza_giorno}
		@@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Data_decorrenza_mese = "+ 			$Data_decorrenza_mese}
    @@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Data_decorrenza_anno = "+ 			$Data_decorrenza_anno}
	end
		
end
