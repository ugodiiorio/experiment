#############################################
#   	Created by Kubepartners			          #
#                                           #
#				13/03/2009						              #
#############################################

gem "selenium-client", ">=1.2.13"
require "selenium/client"

class ConTeTest < Test::Unit::TestCase

  def setup
    begin
      @@logger.info('ConTeTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Compagnia CONTE \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

      @garanzia = "1"
      @verification_errors = []
      const_publisher

      @@logger.debug('ConTe.setup => ' + $compagnia) {"Selenium port: "+ $port}
      @selenium= Selenium::Client::Driver.new \
        :host => "localhost",
        :port => $port,
        #:browser => "*safari",
      :browser => $browser,
        :url => "http://www.conte.it",
        :timeout_in_seconds => $time_out

      @selenium.start_new_browser_session
      @selenium.set_context("test_new")
    rescue Errno::ECONNREFUSED => ex
      @@logger.error('ConTe.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
      raise ex
    rescue Exception => ex
      #      @verification_errors[@verification_errors.size] = ex.message
      @@logger.error('ConTe.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
      raise ex
    end
  end
  
  def teardown
    @selenium.close_current_browser_session #unless $selenium
    assert_equal [], @verification_errors
    #	$Result_file.close
  end
  
  def test_new()

    begin
      @last_element = nil
      #  	@selenium.set_timeout("80000")
      #  	@selenium.set_speed 1000
      #  	@selenium.set_timeout(110000)
      #	  @selenium.type "name=q", "rspec"
      @selenium.open "https://preventivo.conte.it/calculator/"
      sleep 7

      @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Contratto esistente = "+		$Contratto_esistente.to_s()}

      select "page:text_1CNSC", "label=Passaparola"

      if $Polizza_nuova_auto_nuova
        @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto nuova = "+	$Polizza_nuova_auto_nuova.to_s()}
        #per il momento non dovrebbe entrare mai qui dentro
        @@logger.error('ConTeTest.test_new => ' + $compagnia) {" ...  ERRORE! POLIZZA NUOVA AUTO NUOVA"}

        click "page:situazione_1:0"		#polizza nuova
        click "page:situazione_2:0"    	#auto nuova
      else
        if $Polizza_nuova_auto_usata
          click "page:situazione_1:0"		#polizza nuova
          click "page:situazione_2:1"		#auto udata
          @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto usata = "+	$Polizza_nuova_auto_usata.to_s()}
        else
          click "page:situazione_1:1"		#polizza continuata
          @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto usata = false"}
          @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto nuova = false"}
        end
      end
      click "page:privacy_contr"
      click "page:buttonContinua"

      type "page:dataEffetto", $Data_decorrenza
      if $Polizza_nuova_auto_nuova
        select "page:mese_immatricolazione", "label="+ 			$Data_imm_classe_14_mese
        type "page:anno_immatricolazione", 						$Data_decorrenza_anno
        type "page:anno_acquisto", 								$Data_decorrenza_anno
      else
        if $Polizza_nuova_auto_usata
          select "page:mese_immatricolazione", "label="+ 		$Data_immatricolazione_mese
          type "page:anno_immatricolazione",  				$Data_immatricolazione_anno
          type "page:anno_acquisto", 							$Data_decorrenza_anno
        else
          select "page:mese_immatricolazione", "label="+ 		$Data_immatricolazione_mese
          type "page:anno_immatricolazione", 					$Data_immatricolazione_anno
          type "page:anno_acquisto", 							$Data_acquisto_anno
        end
      end
      select "page:alimentazione", "label="+ 						$Alimentazione
      @selenium.fire_event "page:alimentazione", "onchange"

      select "page:marca", "label="+     $Marca_auto

      #      type "page:marca",  										$Marca_auto
      #          @selenium.key_up "page:marca", "\13"
      #click "//li[@onclick='SrchMarca.setResult(" + 				$Codice_marca + ");']"
      #         click "//li[@onclick='srchMarcaIst.setResult(" + 			$Codice_marca + ");']"
      @selenium.fire_event "page:marca", "onchange"
sleep 10
select "page:modelloAuto", "label="+     $Modello_auto
#      	type "page:modelloAuto",  										$Modello_auto
#      	@selenium.key_up "page:modelloAuto", "\13"
      #	#click "//li[@onclick='SrchModello.setResult(" + 			$Codice_modello + ");']"
#      	click "//li[@onclick='srchModelloIst.setResult(" + 			$Codice_modello + ");']"
#      	@selenium.fire_event "page:modelloAuto", "blur"
@selenium.fire_event "page:modelloAuto", "onchange"
sleep 5
      allestimenti = 												$Allestimento_auto.split()
      allestimento = allestimenti[0].to_s() + " " + allestimenti[1].to_s()
#      type "page:allestimento", allestimento
      select "page:allestimento", "label="+     $Allestimento_auto
#      type "page:allestimento", $Allestimento_auto
      @selenium.key_up "page:allestimento", "\13"
      #click "//li[@onclick='SrchAllest.setResult(" + 				$Codice_allestimento + ");']"
#      click "//li[@onclick='srchAllestIst.setResult(" + 				$Codice_allestimento + ");']"
      @selenium.fire_event "page:allestimento", "blur"
#@selenium.fire_event "page:allestimento", "onchange"
      click "page:continua_step01"

      type "page:valore_veicolo", 								$Valore_auto
      select "page:ricovero_notturno", "label=" +					$Ricovero_notturno
      select "page:antifurto", "label=" +	 						$Antifurto
      select "page:uso_prevalente", "label=" +	 				$Uso_abituale_auto
      select "page:km_anno", 	"label=" +							$N_km

      if $Contratto_esistente
        select "page:classeCU", "label=" +						$Classe_BM
      end
      click "page:contraente_proprietario:0"   	#Conducente is proprietario
      click "page:conducente_principale:0"		#Conducente principale
      click "page:buttonContinua"

      click 														$Sesso
      type "page:conducente_nascita", 							$Data_nascita
      select "page:provincia_di_nascita", "label=" + 				$Provincia_residenza
      @selenium.fire_event "page:provincia_di_nascita", "onchange"
      type "page:comune_di_nascita", 								$Comune_residenza
      @selenium.key_up "page:comune_di_nascita", "\13"
      #click "//li[@onclick='SrchComNas.setResult(" + 				$Codice_comune + ");']"
      click "//li[@onclick='srchComNasIst.setResult(" + 				$Codice_comune + ");']"
      @selenium.fire_event "page:comune_di_nascita", "blur"
      #sleep 1
      click "page:buttonContinua"

      select "page:provincia_di_residenza", "label=" + 			$Provincia_residenza
      @selenium.fire_event "page:provincia_di_residenza", "onchange"


      # COMUNE
      type "page:comune_di_residenza", 							$Comune_residenza
      sleep 2
      click "page:comune_di_residenza"
      sleep 2
      click "//li[@onclick='srchComResIst.setResult(" + 				$Codice_comune + ");']"
      sleep 2
      #@selenium.key_up "page:comune_di_residenza", "\13"
      sleep 2
      @selenium.fire_event "page:comune_di_residenza", "blur"
      sleep 2

      #ORIGINALE:
      type "page:comune_di_residenza", 							$Comune_residenza
      #	@selenium.key_up "page:comune_di_residenza", "\13"
      #	#click "//li[@onclick='SrchComRes.setResult(" + 				$Codice_comune + ");']"
      #	click "//li[@onclick='srchComResIst.setResult(" + 				$Codice_comune + ");']"
      #	@selenium.fire_event "page:comune_di_residenza", "blur"
      #	#sleep 1

      type "page:toponimo_residenza", 							$Toponimo
      @selenium.key_up "page:toponimo_residenza", "\13"
      #click "//li[@onclick='SrchToponimi.vals.flagAltri=0;SrchToponimi.setResult(9);']"   #Codice via
      click "//li[@onclick='srchToponimiIst.flagAltri=0;srchToponimiIst.setResult(9);']"
      @selenium.fire_event "page:toponimo_residenza", "blur"
      #sleep 1
      type "page:indirizzo_residenza", 							$Indirizzo_via
      type "page:numero_residenza", 								$Indirizzo_num
      select "page:cap_di_residenza",  "label=" + 				$Cap
#      click "page:buttonContinua3"
      click "page:buttonContinua2"

      type "page:professione_conducente_principale", 				$Professione
      @selenium.fire_event "page:professione_conducente_principale", "blur"
      @selenium.key_up "page:professione_conducente_principale", "\13"
      #click "//li[@onclick='SrchProf.setResult(357);']"   #Codice "Impiegato Azienda"
      click "//li[@onclick='srchProfIst.setResult(357);']"   #Codice "Impiegato Azienda"
      select "page:stato_civile", "label=" + 						$Stato_civile
      click "page:figli_minori:1"   #No figli minori di 17 anni
      type "page:eta_conseguimento_patente", 						$Anni_patente
      #select "page:tipo_patente", "label=Patente Italiana B"
      select "page:tipo_patente", "label=B (auto)"
      select "page:punti_patente", "label=" + 					$Punti_patente_ConTe
      click "page:buttonContinua3"


      click "page:multe_ebrezza_contraente:1"  #no multe in stato di ebbrezza
      click "page:sospensione_patente_contraente:1"   # no sospensione patente
      click "page:altro_veicolo:1"   # no utilizzo altro veicolo

      if $Contratto_esistente
        click "page:buttonContinua6"
      else
        click "page:buttonContinua198"
      end

      if $Contratto_esistente
        click "page:sinistri_cc:1"   # no sinistri con colpa negli ultimi 3 anni
        click "page:sinistri_sc:1"   # no sinistri senza colpa negli ultimi 3 anni
        click "page:buttonContinua14"
      end

      type "page:cognome_contraente", 							$Cognome
      type "page:nome_contraente", 								$Nome
      type "page:email_contraente", 								$e_mail
      type "page:prefisso_cellulare_contraente", 					$Mobile_prefisso
      type "page:cellulare_contraente", 							$Mobile_suffisso
      click "page:buttonContinua3"

      click "page:radioGuidatori:1"  # guidatori tutti maggiori di 18 anni
      @selenium.fire_event "page:radioGuidatori:1", "change"
      click "page:buttonCalcolaPremio"

      #	premio_loc = "page:quota_info:0:j_id186"
      premio_loc = "page:quota_info:0:colonna_Premi"
      #	premio_loc = "page:quota_info:0:j_id217"
      wait_for_elm(premio_loc)
      #	premio0 = @selenium.get_text("id=page:quota_info:0:j_id202")
      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Premio0  = "+premio0}
      #	click_coperture "page:quota_info:1:garanziaChecked"   # no incendio e furto
      #	click_coperture "page:quota_info:8:garanziaChecked"   #no assistenza stradale
      #	click_coperture "page:quota_info:9:garanziaChecked"   # no tutela legale
      select "page:quota_info:0:massimaleRCA", "label="+ 			$Massimale_RCA
      if @selenium.is_element_present("page:ricalcola_but")
        click "page:ricalcola_but"
        sleep 25
        wait_for_elm(premio_loc)
        sleep 10
      end

      premio = @selenium.get_text(premio_loc)

      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"premio" + premio}
      #	premio2 = @selenium.get_text("page:quota_info:0:j_id204")
      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"premio 2" + premio2}
      #	premio = @selenium.get_text(premio_loc)
      #	print "Premio  = "+premio
      #	html = @selenium.get_html_source()
      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {html}
      #	sleep 40
      #	premio = @selenium.get_text(xpath="//table")
      #	premio = @selenium.get_text(xpath="//table[@width='1024']/tbody/tr/td[@class='table_box']")
      #	premio = @selenium.get_text(xpath="//table[@width='1010']/tbody/tr/td[@class='table_box']")
      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Premio  = "+premio}
      #	#premio2 = @selenium.get_text("xpath=//table[@id='page:premio']/tbody/tr/td/table[@border='0']/tbody/tr/td[@class='bg_premio_quota']/span[@class='td_label']")
      #	premio2 = @selenium.get_text(xpath="//td[@id='page:quota_info:0:j_id202']")
      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Premio2  = "+premio2}
      # 	#premio = @selenium.get_value("bg_premio_quota")

      raise RangeError, "Price cannot be nil" unless premio
      @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      str = premio.split
      premio = str[1].gsub(".","") if str[1].count(",") > 0
      premio = premio.gsub(",",".")

      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    rescue Timeout::Error => ex
      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('ConTeTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('ConTeTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    end
  end 
  
  def select(element, label)
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"      ...la label = "+label}
    wait_for_select(element, label)
    @selenium.select element, label
  end
  
  def click(element)
  	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
  	wait_for_elm(element)
    @selenium.click element
  end  
  
  def type(element, label)
  	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
  	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"      ...la label = "+label}
  	wait_for_elm(element)
    @selenium.type element, label
  end    
  
  def wait_for_select(nome_elemento_combo, label)
    @last_element = nome_elemento_combo
  	sleep $sleep
  	if(nome_elemento_combo==nil)
  		@@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
      raise RangeError, "Wait for select failed! Element cannot be nil"
  	end
    if(label==nil)
  		@@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
      raise RangeError, "Wait for select failed! Label cannot be nil"
  	end
    label= label.gsub!("label=","")
    if(label==nil)
      @@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
      raise RangeError, "Wait for select failed! Label cannot be nil"
    end
	  @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
	  @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Label = "+label}
	  
	  @selenium.wait_for_element nome_elemento_combo
	  var = @selenium.element? nome_elemento_combo
	  @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }	
  end
  
  def wait_for_elm(nome_elemento)
    @last_element = nome_elemento
	  sleep $sleep
	  if(nome_elemento==nil)
		  @@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
      raise RangeError, "Wait for element failed! Element cannot be nil"
	  end	  
	  @selenium.wait_for_element nome_elemento
	  @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
	  
	  var = @selenium.element? nome_elemento
	  if var
      @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
    else
  	  @@logger.error('ConTeTest.test_new => ' + $compagnia) {"Elemento = "+nome_elemento +" non presente"}
      raise RangeError, "Wait for element failed! Element not present"
    end
  end	    
  
  def click_coperture(nome_elemento)
    @last_element = nome_elemento
    sleep $sleep

    if(nome_elemento==nil)
      @@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
    end
    var = @selenium.element? nome_elemento
    if var
      if @selenium.is_checked nome_elemento
        @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Click su elemento = "+ nome_elemento}
        @selenium.uncheck nome_elemento
        #@selenium.fire_event nome_elemento, "click"
        sleep 2
      end
    else
    end
  end  
   
	def const_publisher()
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"sleep: "+ 						$sleep.to_s()}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"N_km = "+ 						$N_km}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_decorrenza = "+ 			$Data_decorrenza}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_acquisto_anno = "+ 		$Data_acquisto_anno}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Valore_auto = "+ 				$Valore_auto}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Tipo_patente = "+ 				$Tipo_patente}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Punti_patente_ConTe = "+ 		$Punti_patente_ConTe}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_decorrenza_giorno = "+ 		$Data_decorrenza_giorno}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_decorrenza_mese = "+ 			$Data_decorrenza_mese}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_decorrenza_anno = "+ 			$Data_decorrenza_anno}
  
    # VARIABILI PROFILO
    # --generiche
  	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_nascita_giorno = "+ 		$Data_nascita_giorno}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_nascita_mese = "+ 			$Data_nascita_mese}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_nascita_anno = "+ 			$Data_nascita_anno}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Cap = "+ 						$Cap}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_immatricolazione_mese = "+ $Data_immatricolazione_mese}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_immatricolazione_anno = "+ $Data_immatricolazione_anno}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Anni_patente = "+ 				$Anni_patente}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Classe_BM = "+ 					$Classe_BM}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Sesso = "+ 						$Sesso}
    # --specifiche compagnia
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Provincia_residenza = "+ 		$Provincia_residenza}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Alimentazione = "+ 				$Alimentazione}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Marca_auto = "+ 				$Marca_auto}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Allestimento_auto = "+ 			$Allestimento_auto}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Professione = "+ 				$Professione}
    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Stato_civile = "+ 				$Stato_civile}
			  
			  
		# VARIABILI ANAGRAFICA
		# -- generiche 
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Nome = "+ 						$Nome}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Indirizzo_via = "+ 				$Indirizzo_via}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Indirizzo_num = "+ 				$Indirizzo_num}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Mobile_prefisso = "+ 			$Mobile_prefisso}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Mobile_suffisso = "+ 			$Mobile_suffisso}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"e_mail = "+ 					$e_mail}
		# -- specifiche compagnia
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Toponimo = "+ 			$Toponimo}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Comune residenza  = "+ 			$Comune_residenza}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Codice Comune  = "+ 			$Codice_comune}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"profilo " + 					$profilo_assicurativo}
		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Massimale RCA " + 				$Massimale_RCA}
			
    #		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Contratto esistente = "+		$Contratto_esistente.to_s()}
    #		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto usata = "+	$Polizza_nuova_auto_usata.to_s()}
    #		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto nuova = "+	$Polizza_nuova_auto_nuova.to_s()}
	end
	
end
