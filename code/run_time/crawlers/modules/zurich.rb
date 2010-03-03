#############################################
#   	Created by Kubepartners			          #
#                                           #
#				13/03/2009						              #
#############################################

gem "selenium-client", ">=1.2.13"
require "selenium/client"

class ZurichTest < Test::Unit::TestCase

  def setup
    begin
      @@logger.info('ZurichTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Compagnia ZURICH \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

      @garanzia = "1"
      @verification_errors = []
      const_publisher

      @@logger.debug('ZurichTest.setup => ' + $compagnia) {"Selenium port: "+ $port}
      @selenium= Selenium::Client::Driver.new \
        :host => "localhost",
        :port => $port,
        :browser => $browser,
        :url => "http://www.zurich-connect.it",
        :timeout_in_seconds => $timeout_in_sec

      @selenium.start_new_browser_session
      @selenium.set_context("test_new")
    rescue Errno::ECONNREFUSED => ex
      @@logger.error('ZurichTest.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
      raise ex
    rescue Exception => ex
#      @verification_errors[@verification_errors.size] = ex.message
      @@logger.error('ZurichTest.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
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
      @selenium.open "http://www.zurich-connect.it/default.aspx?Target=AssicurazioneAuto"
#      click "NavHeader1_Hyperlink4"
      @selenium.wait_for_page_to_load $wait_for_page_to_load
       
      click "//img[@alt='Fai il preventivo']"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      select "ddlFonteConoscenza", "label="+							$Conoscenza_Zurich

      if $Polizza_nuova_auto_nuova
        select "//option[@value='1040']"
      else
        if $Polizza_nuova_auto_usata
          select "ddlSituazioneAssicurativa", "label="+					"Sto acquistando un'auto usata e mi assicuro per la prima volta"
        else
          select "ddlSituazioneAssicurativa", "label="+					$Situaziona_assicurativa
        end
      end

      type "txtDataDecorrenzaPolizza", 								$Data_decorrenza
      type "txtDataScadenza", 										$Data_decorrenza
      select "ddlContraenteProp", "label="+							$Contraente_is_proprietario= "SI"
        click "Avanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        click "//div[@id='domanda1']/p[2]"
        click 															$Sesso
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        type "txtDataNascita", 											$Data_nascita
        select "ddlNazionalita", "label="+								$Nazionalita
        select "ddlstatociv2", "label="+								$Stato_civile
        select "ddlTitoloStudio", "label="+								$Titolo_studio_Zurich
        select "ddlprofessione", "label="+								$Professione
        type "txtCapResidenza", 										$Cap
        click "btnLocalita"

        @selenium.wait_for_page_to_load $wait_for_page_to_load
      select "ddlLocalita", "label="+									$Comune_residenza

        click "Avanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      sleep 3
        select "ddlAlimentazione", "label="+							$Alimentazione
      sleep 3
      if $Polizza_nuova_auto_nuova
        select "ddlMeseImm", "label="+									$Data_decorrenza_mese
        sleep 3
        select "ddlAnno", "label="+										$Data_decorrenza_anno
        sleep 3
      else
        if $Polizza_nuova_auto_usata
          select "ddlMeseImm", "label="+									$Data_immatricolazione_mese
          sleep 3
          select "ddlAnno", "label="+										$Data_immatricolazione_anno
          sleep 5
        else
          select "ddlMeseImm", "label="+									$Data_immatricolazione_mese
          sleep 3
          select "ddlAnno", "label="+										$Data_immatricolazione_anno
          sleep 5
        end
      end

        select "ddlMarca", "label="+									$Marca_auto
      sleep 5
        select "ddlModello", "label="+									$Modello_auto
        sleep 3
      select "ddlAllestimento", "label="+								$Allestimento_auto
        click "Avanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        select "ddlAntifurto", "label="+								$Antifurto
      type 	"txtValoriVeicoli", 									"5000"
        select "ddlanti", "label="+										$Antifurto2
      select "ddlGancioTraino", "label="+								$No_gancio_traino
      select "ddlStabiliz", "label="+									$No_stabilizzatore
      select "ddlABS", "label="+ 										$Si_ABS
      select "ddlairbag", "label="+									$Si_airbag
        click "Avanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      if $Polizza_nuova_auto_nuova
      else
        if $Polizza_nuova_auto_usata
        else
          select "ddlClasseUniversale", "label="+							$Classe_BM
          click "//option[@value='"+										$N_sinistri_5_anni+"']"
        end
      end
        click "btnAvanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        click "//img[@alt='Calcola il premio']"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      @selenium.wait_for_element "ddlMassimaleRCA"
      lab = @selenium.get_selected_label "ddlMassimaleRCA"
      @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
      if (lab.strip != $Massimale_RCA.strip)
        select "ddlMassimaleRCA", "label="+ 						$Massimale_RCA
        sleep 3
      end
      click $No_incendio_furto
      click $No_infortuni_conducente
      click "btnCalcola"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      premio = @selenium.get_text("lblvPremioAnnualeLordoSconto")
      #premio = @selenium.get_text("lblvPremioAnnualeLordo")
      str = premio.split
      premio = str[0]
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio
      #premium2 = @selenium.get_text("//div[@id='lblvPremioAnnualeLordo']")
      @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      raise RangeError, "Price cannot be nil" unless premio

      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    rescue Timeout::Error => ex
      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('ZurichTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('ZurichTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    end
	end 
	
	def select(element, label)
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_select(element, label)
	  @selenium.select element, label.strip
	end
	
	def click(element)
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
	  wait_for_elm(element)
	  @selenium.click element 	
	end  
	
	def type(element, label)
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_elm(element)
	  @selenium.type element, label
	end     
  
  def wait_for_select(nome_elemento_combo, label)
    @last_element = nome_elemento_combo
    sleep $sleep
  	if(nome_elemento_combo==nil)
  		@@logger.error('ZurichTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
  	end
    if(label==nil)
        @@logger.error('ZurichTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
      end
    label= label.gsub!("label=","")
    if(label==nil)
      @@logger.error('ZurichTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
    end
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Label = "+label}
	  @selenium.wait_for_element nome_elemento_combo
	  var = @selenium.element? nome_elemento_combo
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label.strip)); sleep 1 }
  end
  
  def wait_for_elm(nome_elemento)
    @last_element = nome_elemento
	  sleep $sleep
	  if(nome_elemento==nil)
		  @@logger.error('ZurichTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
	  end	  
	  @selenium.wait_for_element nome_elemento
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
	  var = @selenium.element? nome_elemento
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
  end  
  
  def const_publisher 
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Stato_civile 	 =	" +		$Stato_civile}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Professione  	 =	" +		$Professione}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Alimentazione  	 =	" +		$Alimentazione}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Marca_auto  	 =	" +		$Marca_auto}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Modello_auto  	 =	" +		$Modello_auto}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Allestimento_auto  	 =	" +		$Allestimento_auto}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Classe_BM  	 =	" +		$Classe_BM}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$N_sinistri_5_anni  	 =	" +		$N_sinistri_5_anni}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Data_nascita_giorno	 =	" +		$Data_nascita_giorno}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Data_nascita_mese	 =	" +		$Data_nascita_mese}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Data_nascita_anno	 =	" +		$Data_nascita_anno}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Data_nascita	 =	" +		$Data_nascita}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Sesso	 =	" +		$Sesso}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Cap	 =	" +		$Cap}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Data_immatricolazione_mese	 =	" +		$Data_immatricolazione_mese}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Data_immatricolazione_anno	 =	" +		$Data_immatricolazione_anno}
    @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Data_decorrenza_giorno	 =	" +		$Data_decorrenza_giorno}
    @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Data_decorrenza_mese	 =	" +		$Data_decorrenza_mese}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Data_decorrenza_anno	 =	" +		$Data_decorrenza_anno}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Comune_residenza =  " +  $Comune_residenza}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"$Titolo_studio_Zurich  =  " + $Titolo_studio_Zurich}
	  @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
  end
  	
end


## COSTANTI
#$Conoscenza_Zurich  Pagine Gialle/elenchi telefonici
#$Conoscenza_Zurich_opt_label   'A2       '
#$Situaziona_assicurativa  L'automobile e' gia' assicurata con un contratto in Bonus/Malus"
#$Situazione_assicurativa_opt_label  '1000'
#$Data_decorrenza  "01/04/2009"
#$Nazionalita  ITALIA" 
#$Nazionalita_opt_value  'I        '
#$Antifurto  ASSENTE"
#$Antifurto_opt_label  'A   '
#$Antifurto2  Assente"
#$Antifurto2_opt_label  'N   '
#
## VARIABILI PROFILO
## --generiche
#$Data_nascita  "01/01/1982"
#$Cap   "70037"
#$Sesso  "Maschio"
## --specifiche compagnia

#$Stato_civile  Single"
#$Stato_civile_opt_value  'G        '
#$Professione  COMMERCIANTE (GENERICO)"
#$Professione_opt_label  '12E1'
#$Alimentazione  BENZINA"
#$Alimentazione_opt_label  'B   '
#$Data_immatricolazione_mese    10"
#$Data_immatricolazione_mese_opt_label '10'
#$Data_immatricolazione_anno  2006"
#$Data_immatricolazione_anno_opt_label  '2006'
#$Marca_auto   FIAT"
#$Marca_auto_opt_label  '00008    '
#$Modello_auto   Punto 3ª serie"
#$Modello_auto_opt_value   '03398'
#$Allestimento_auto  Punto 3ª serie 1.2 5 porte Dynamic 02/05"
#$Allestimento_auto_opt_value  '0E83C052'
#$Clasee_BM  14"
#$Classe_BM_opt_value '14'
#$N_Sinistri_5_anni  '0   '
#
## VARIABILI ANAGRAFICA
## -- generiche
## -- specifiche compagnia
#$Titolo_studio   Laurea"
#$Titolo_studio_opt_label  option[3]
