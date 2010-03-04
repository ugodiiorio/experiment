#############################################
#   	Created by Kubepartners			          #
#                                           #
#				13/03/2009						              #
#############################################

gem "selenium-client", ">=1.2.13"
require "selenium/client"

class LinearTest < Test::Unit::TestCase

  def setup
    begin
      @@logger.info('LinearTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Compagnia LINEAR \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

    	$Sesso = "//input[@id='sesso' and @name='sesso' and @value='"+ $Sesso +"']"
      @garanzia = "1"
      @verification_errors = []
      const_publisher

      @@logger.debug('LinearTest.setup => ' + $compagnia) {"Selenium port: "+ $port}
      @selenium= Selenium::Client::Driver.new \
        :host => "localhost",
        :port => $port,
        :browser => $browser,
        :url => "http://www.linear.it",
        :timeout_in_seconds => $timeout_in_sec

      @selenium.start_new_browser_session
      @selenium.set_context("test_new")
    rescue Errno::ECONNREFUSED => ex
      @@logger.error('LinearTest.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
      raise ex
    rescue Exception => ex
#      @verification_errors[@verification_errors.size] = ex.message
      @@logger.error('LinearTest.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
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
      @selenium.open "/default.asp"
      click "//img[@alt='Preventivi online: auto, moto e casa']"
      click "//img[@alt='Preventivo automobile']"

      if $Polizza_nuova_auto_nuova
        select "cond_ass_cb", "label="+	"Deve essere assicurata per la prima volta"
      else
        if $Polizza_nuova_auto_usata
          select "cond_ass_cb", "label="+									"Deve essere assicurata per la prima volta"
        else
          select "cond_ass_cb", "label="+									$Situazione_assicurativa_BM
        end
      end

      select "decorrenza_giorno", "label="+								$Data_decorrenza_giorno
        select "decorrenza_mese", "label="+								$Data_decorrenza_mese
        select "decorrenza_anno", "label="+								$Data_decorrenza_anno

      if $Polizza_nuova_auto_nuova
        select "frazionamento_cb", "label="+						$Frazionamento_polizza
        type "sinistri15anno_mese",											$N_sinistri_5_anni
        type "sinistri15anno_anno",											$N_sinistri_1_anno
      else
        if $Polizza_nuova_auto_usata
        else
          select "classe_merito_cb", "label="+						$Classe_BM
          select "frazionamento_cb", "label="+						$Frazionamento_polizza
          select "anni_continuita_ass", "label="+					'Sì'
          type "sinistri15anno_mese",											$N_sinistri_5_anni
          type "sinistri15anno_anno",											$N_sinistri_1_anno
        end
      end

      click "nextStep"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      if $Polizza_nuova_auto_nuova
        select "imm_mese", "label="+										$Data_imm_classe_14_mese
        select "imm_anno", "label="+										$Data_decorrenza_anno
      else
        if $Polizza_nuova_auto_usata
          select "imm_mese", "label="+										$Data_immatricolazione_mese
          select "imm_anno", "label="+										$Data_immatricolazione_anno
        else
          select "imm_mese", "label="+										$Data_immatricolazione_mese
          select "imm_anno", "label="+										$Data_immatricolazione_anno
        end
      end

        select "marca_auto", "label="+										$Marca_auto
        select "modello_auto", "label="+									$Modello_auto
        select "allestimento_auto", "label="+								$Allestimento_auto
      click 																$Antifurto
        select "ricovero_auto", "label="+									$Ricovero_auto
        select "utilizzo_auto", "label="+									$Utilizzo_auto
        type "km_anno", 													$N_km
        click "nextStep"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        select "nascita_giorno", "label="+									$Data_nascita_giorno
        select "nascita_mese", "label="+									$Data_nascita_mese
        select "nascita_anno", "label="+									$Data_nascita_anno
      click 																$Sesso
        select "patente_mese", "label="+									$Data_patente_mese
        select "patente_anno", "label="+									$Data_patente_anno
        select "eta_inferiore", "label="+									$N_eta_inferiore_26
      click 																$Conducente_is_proprietario
        type "comune_residenza", 											$Comune_residenza
        @selenium.fire_event "comune_residenza", "blur"
        click "nextStep"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

        #click "//img[@alt='Ok']"
        select "nascita_giorno", "label="+									$Data_nascita_giorno
        select "nascita_mese", "label="+									$Data_nascita_mese
        select "nascita_anno", "label="+									$Data_nascita_anno
        type "comune_residenza", 											$Comune_residenza
        click "nextStep"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        click "nextStep"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      @selenium.wait_for_element "massimale_1"
#      lab = @selenium.get_selected_label "massimale_1"
#      @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
#      if (lab != $Massimale_RCA)
#        select "massimale_1", "label="+ 								$Massimale_RCA
#        @selenium.select "massimale_1", "label=regexp:€\\s2\\.500\\.000 - 500\\.000"
      select_regex "massimale_1", "label=" + $Massimale_RCA

#      end
      sleep 5
      premio = @selenium.get_text("imp_massimale_1")
      #premio = @selenium.get_text("totaleImporto")
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio
      @@logger.debug('LinearTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      raise RangeError, "Price cannot be nil" unless premio

      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @@logger.debug('LinearTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    rescue Timeout::Error => ex
      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('LinearTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('LinearTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    end
	end 
	
	def select_regex(element, label)
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"      ...la label con regex = "+label}
	  wait_for_select(element, label, "regex")
	  @selenium.select element, label
	end

	def select(element, label)
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_select(element, label)
	  @selenium.select element, label  	
	end
	
	def click(element)
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
	  wait_for_elm(element)
	  @selenium.click element 	
	end  
	
	def type(element, label)
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_elm(element)
	  @selenium.type element, label  	
	end     
  
  def wait_for_select(nome_elemento_combo, label, regex = nil)
    @last_element = nome_elemento_combo
    sleep $sleep
  	if(nome_elemento_combo==nil)
  		@@logger.error('LinearTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
  	end
  	if(label==nil)
  		@@logger.error('LinearTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
  	end
    label= label.gsub!("label=","")
    if(label==nil)
      @@logger.error('LinearTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
    end
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Label = "+label}
	  wait_for_elm nome_elemento_combo
	  var = @selenium.element? nome_elemento_combo
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }	unless regex
  end
  
  def wait_for_elm(nome_elemento)
    @last_element = nome_elemento
	  sleep $sleep
	  if(nome_elemento==nil)
		  @@logger.error('LinearTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
	  end	  
	  @selenium.wait_for_element nome_elemento
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
	  var = @selenium.element? nome_elemento
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
  end	  
  
  def const_publisher
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Situazione_assicurativa_BM = " + $Situazione_assicurativa_BM}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Comune_residenza 	 =	" +		$Comune_residenza}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_nascita	 =	" +		$Data_nascita}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_nascita_giorno	 =	" +		$Data_nascita_giorno}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_nascita_mese	 =	" +		$Data_nascita_mese}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_nascita_anno	 =	" +		$Data_nascita_anno}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_patente	 =	" +		$Data_patente}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_patente_mese	 =	" +		$Data_patente_mese}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_patente_anno	 =	" +		$Data_patente_anno}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_immatricolazione	 =	" +		$Data_immatricolazione}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_immatricolazione_mese	 =	" +		$Data_immatricolazione_mese}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_immatricolazione_anno	 =	" +		$Data_immatricolazione_anno}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Sesso	 =	" +		$Sesso}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$N_sinistri_5_anni	 =	" +		$N_sinistri_5_anni}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$N_sinistri_1_anno	 =	" +		$N_sinistri_1_anno}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Classe_BM  	 =	" +		$Classe_BM}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Marca_auto  	 =	" +		$Marca_auto}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Modello_auto  	 =	" +		$Modello_auto}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"$Allestimento_auto  	 =	" +		$Allestimento_auto}
	  @@logger.debug('LinearTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
    @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Data_decorrenza_giorno = "+ 		$Data_decorrenza_giorno}
		@@logger.debug('LinearTest.test_new => ' + $compagnia) {"Data_decorrenza_mese = "+ 			$Data_decorrenza_mese}
    @@logger.debug('LinearTest.test_new => ' + $compagnia) {"Data_decorrenza_anno = "+ 			$Data_decorrenza_anno}
  end
    
end

