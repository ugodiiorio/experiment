#############################################
#   	Created by Kubepartners			          #
#                                           #
#				13/03/2009						              #
#############################################

gem "selenium-client", ">=1.2.13"
require "selenium/client"

class DirectLineTest < Test::Unit::TestCase

  def setup
    begin
      @@logger.info('DirectLineTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Compagnia DIRECTLINE \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

      @garanzia = "1"
      @verification_errors = []
      const_publisher

      @@logger.debug('DirectLineTest.setup => ' + $compagnia) {"Selenium port: "+ $port}
      @selenium= Selenium::Client::Driver.new \
        :host => "localhost",
        :port => $port,
        :browser => $browser,
        :url => "http://www.directline.it",
        :timeout_in_seconds => $time_out

      @selenium.start_new_browser_session
      @selenium.set_context("test_new")
    rescue Errno::ECONNREFUSED => ex
      @@logger.error('DirectLineTest.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
      raise ex
    rescue Exception => ex
#      @verification_errors[@verification_errors.size] = ex.message
      @@logger.error('DirectLineTest.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
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
      @selenium.open "/index.jhtml?page=/index.jhtml"
      click "btn_link_clicca_qui"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      #click "//input[@name='tipoPolizza' and @value='AU']"
      #
      if $Polizza_nuova_auto_nuova
        click													"//input[@name='tipoPolizza' and @value='AN']"      #Polizza nuova
      else
        if $Polizza_nuova_auto_usata
          click 												"//input[@name='tipoPolizza' and @value='AU']"
        else
          click 																$Situazione_assicurativa
          click 																$Situazione_assicurativa_bersani
        end
      end

        type "dataInizioValidita", 													$Data_decorrenza
        select "ConoscenzaAllState", "label="+										$Conoscenza_compagnia
        click "SUBMIT"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      type "datadinascita", 														$Data_nascita
        click "//input[@name='sessoContraente' and @value='"+ 						$Sesso +"']"
        #select "/qol/application/beans/vo/VoContraente.strCodStatoCivile", "label="+	$Stato_civile
        select "idstatocivile", "label=Sposato/a"
      select "/qol/application/beans/vo/VoContraente.strCodProfessione", "label="+	$Professione
        type "CAP", 																	$Cap
        select "/qol/application/beans/vo/VoContraente.strAnniPatente", "label="+		$N_anni_patente
        click 																		$Intestatario_conducente
        click 																		$Intestatario_proprietario
        click "SUBMIT"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      sleep 3
      select "numConducentiU26Dich", "label="+									$N_conducenti_inf_26
        click "AutoAssicurateAllstate"
        click "//input[@name='AutoAssicurateAllstate' and @value='"+				$Altri_conducenti_assicurati+ "']"
        click "SUBMIT"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      if $Polizza_nuova_auto_nuova
        #click "//input[@name='Assic5a' and @value='"+								$Flag_non_assicurato_5_anni+"']"
        type "annoprimaimmatricolazione", 											$Data_imm_classe_14_mese + "/" + $Data_decorrenza_anno
        #type "dataacquistoauto", 													$Data_decorrenza_anno
      else
        if $Polizza_nuova_auto_usata
          type "annoprimaimmatricolazione", 											$Data_immatricolazione
          type "dataacquistoauto", 													$Data_decorrenza_anno
          click "//input[@name='/qol/application/beans/vo/VoBMAgevolata.intProvenienza' and @value='0']"  #no bersani
        else
          select "classeProvenienzaAuto","label="+									$Classe_BM_provenienza
          select "classeAssegnazioneAuto","label="+									$Classe_BM_assegnazione
          click "//input[@name='Assic5a' and @value='"+								$Flag_assicurato_5_anni+"']"
          type "annoprimaimmatricolazione", 											$Data_immatricolazione
          type "dataacquistoauto", 													$Data_acquisto_auto_anno
          click "//input[@name='Sinistri5a' and @value='"+							$Flag_sinistri_5_anni+"']"
        end

      end

        click "select_marca"
        select "select_marca", "label="+											$Marca_auto
      @selenium.fire_event "select_marca", "blur"
      select "select_modelli", "label="+											$Modello_auto
        sleep 2
        click "PROSEGUI"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

        select "allestimentoAuto", "label="+										$Allestimento_auto
        select "UsoPra", "label="+ 													$Uso_auto
        type "KMPercorsi", 															$N_km
        click "PROSEGUI"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      select "iCodRicoveroNotturno", "label="+ 									$Ricovero_notturno
      select "iCodAntifurto", "label="+											$Antifurto
        #click "/qol/application/beans/vo/VoAuto.vectorOptional[2].strFlagSelezionato"
        click "SUBMIT"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      click "AVANTI"
      @selenium.wait_for_page_to_load $wait_for_page_to_load


      click_coperture $No_bonus_protetto
      click_coperture	$No_incendio_furto
      click_coperture	$No_infortuni_conducente
      click_coperture	$No_assistenza
      click_coperture	$No_tutela_legale
      click "RICALCOLA"
      @selenium.wait_for_page_to_load $wait_for_page_to_load
      select_massimale("SelM_RCA", "RICALCOLA")

      #premio = @selenium.get_text "premioRCADiv"
      premio = @selenium.get_text("//div[@id='premioTotaleAnnuoEuroDiv']/font")	#questo premio include lo sconto !!!
      premio = premio[3..premio.length()]
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio
      @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      raise RangeError, "Price cannot be nil" unless premio

      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    rescue Timeout::Error => ex
      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('DirectLineTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('DirectLineTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    end
	end 
	
	def select(element, label)
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_select(element, label)
	  @selenium.select element, label  	
	end
	
	def click(element)
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
	  wait_for_elm(element)
	  @selenium.click element 	
	end  
	
	def type(element, label)
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_elm(element)
	  @selenium.type element, label  	
	end    
  
  def wait_for_select(nome_elemento_combo, label)
    @last_element = nome_elemento_combo
  	sleep $sleep
  	if(nome_elemento_combo==nil)
  		@@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
  	end
	if(label==nil)
  		@@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
  	end
	label= label.gsub!("label=","")
	if(label==nil)
		@@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
	end
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Label = "+label}
	  	  
	  @selenium.wait_for_element nome_elemento_combo
	  var = @selenium.element? nome_elemento_combo
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }	
  end
  
  def wait_for_elm(nome_elemento)
    @last_element = nome_elemento
	  sleep $sleep
	  if(nome_elemento==nil)
		  @@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
	  end	  
	  @selenium.wait_for_element nome_elemento
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
	  var = @selenium.element? nome_elemento
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
  end	  
  
  def select_massimale(combo, recalculate)
	  @selenium.wait_for_element combo
	  lab = @selenium.get_selected_label combo
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
	  if (lab != $Massimale_RCA)
		  select combo, "label="+ $Massimale_RCA
		  click recalculate
		  @selenium.wait_for_page_to_load $wait_for_page_to_load 
	  end  	
  end
  
  def click_coperture(nome_elemento)
    @last_element = nome_elemento
    sleep $sleep
    @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Click su elemento = "+ nome_elemento}
    if(nome_elemento==nil)
      @@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
    end
      var = @selenium.element? nome_elemento
      if var
        checked = @selenium.get_value nome_elemento
        if checked.to_s() == "on"
            click nome_elemento
        end
      else
      end
  end   
  
  def const_publisher
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Professione  	 				=	" +	$Professione}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$N_anni_patente  	 			=	" +	$N_anni_patente}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_nascita	 				=	" +	$Data_nascita}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_nascita_giorno				=	" +	$Data_nascita_giorno}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_nascita_mese	 			=	" +	$Data_nascita_mese}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_nascita_anno	 			=	" +	$Data_nascita_anno}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Sesso	 						=	" +	$Sesso}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Stato_civile 	 				=	" +	$Stato_civile}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Cap	 							=	" +	$Cap}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Classe_BM_provenienza  			=	" +	$Classe_BM_provenienza}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Classe_BM_assegnazione  		=	" +	$Classe_BM_assegnazione}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Flag_sinistri_5_anni  			=	" +	$Flag_sinistri_5_anni}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Marca_auto  	 				=	" +	$Marca_auto}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Modello_auto  	 				=	" +	$Modello_auto}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Allestimento_auto  	 			=	" +	$Allestimento_auto}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_immatricolazione			=	" +	$Data_immatricolazione}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_immatricolazione_anno   	=	" +	$Data_immatricolazione_anno}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_immatricolazione_mese   	=	" +	$Data_immatricolazione_mese}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_immatricolazione_giorno 	=	" +	$Data_immatricolazione_giorno}
	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
    @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Data_decorrenza_giorno = "+ 		$Data_decorrenza_giorno}
		@@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Data_decorrenza_mese = "+ 			$Data_decorrenza_mese}
    @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Data_decorrenza_anno = "+ 			$Data_decorrenza_anno}
  end
end
