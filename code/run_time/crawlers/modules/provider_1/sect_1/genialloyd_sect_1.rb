#############################################
#   	Created by Kubepartners			          #
#                                           #
#				13/03/2009						              #
#############################################

gem "selenium-client", ">=1.2.13"
require "selenium/client"

class GenialloydTest < Test::Unit::TestCase

  def setup
    begin
      @@logger.info('GenialloydTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Compagnia GENIALLOYD \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

      @garanzia = "1"
      @verification_errors = []
      const_publisher

      @@logger.debug('GenialloydTest.setup => ' + $compagnia) {"Selenium port: "+ $port}
      @selenium= Selenium::Client::Driver.new \
        :host => "localhost",
        :port => $port,
        :browser => $browser,
  #			:browser => "*safari",
        :url => "http://www.genialloyd.it",
        :timeout_in_seconds => $timeout_in_sec

      @selenium.start_new_browser_session
      @selenium.set_context("test_new")
    rescue Errno::ECONNREFUSED => ex
      @@logger.error('GenialloydTest.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
      raise ex
    rescue Exception => ex
#      @verification_errors[@verification_errors.size] = ex.message
      @@logger.error('GenialloydTest.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
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
    #  	@selenium.boolean_array_command("jsonFactory.searchLocalityByZipCode", "20135")
    #	@selenium.http_post "{\"id\":2,\"method\":\"jsonFactory.searchLocalityByZipCode\",\"params\":[\"20135\",\"GDaZpGLIVgqVHxGTStPMsOr\"]}"
    @selenium.open "/"
    @selenium.click "//div[@id='content1']/a"
    @selenium.wait_for_page_to_load $wait_for_page_to_load
    @selenium.click "link=Fai un preventivo auto"
    @selenium.wait_for_page_to_load $wait_for_page_to_load

      if $Polizza_nuova_auto_nuova
        click "situazione2"
     
      else
        if $Polizza_nuova_auto_usata
          click "situazione2"

        else
          click 													$Situazione_assicurativa
#         
        end
      end

    click $Sesso
    type "loc",						$Cap
    @selenium.key_up("loc","\13" )
    type "dataNasc", $Data_nascita   
#    click "//input[@value='Avanti']"
    select "professione", "label="+ $Professione
    click "//option[@value='0009']"
    select "comboFontePubblicitaria", "label=" + $Conoscenza
    type "emailFascicolo", $e_mail
    click "//input[@value='Avanti']"
    @selenium.wait_for_page_to_load $wait_for_page_to_load
    click "//div[4]/div/div[2]/a[2]"
    @selenium.wait_for_page_to_load $wait_for_page_to_load
    select "month", "label="+ $Data_immatricolazione_mese
    select "year", "label=" + $Data_immatricolazione_anno
    select "marca", "label=" + $Marca_auto
    select "modello", "label=" + $Modello_auto
#    @selenium.click "//option[@value='003415']"
    select "selAllestimento", "label=" + $Allestimento_auto
    click "//input[@value='Avanti']"
    @selenium.wait_for_page_to_load $wait_for_page_to_load

    select "percorrenza", "label="+ 							$N_km
    if $Polizza_nuova_auto_nuova
        click "//input[@value='Avanti']"
      else
        if $Polizza_nuova_auto_usata
          click "//input[@value='Avanti']"
        else
        select "classeCU", "label=" + $Classe_BM + " B/M"
        select "sinistriUltimiAnni", "label="+						$N_sinistri
        select "sinistriUltimiDueAnni", "label="+					$N_sinistri_ultimi_2_anni
        type "date2", $Data_decorrenza_giorno + "/" +$Data_decorrenza_mese + "/" +$Data_decorrenza_anno
        click "//input[@value='Avanti']"
        end
    end
    
    @selenium.wait_for_page_to_load $wait_for_page_to_load
#    click "//table/tbody/tr[4]/td/div/span/label/input"
#  @selenium.click "101"
#    sleep 10
#    select "bean.codiceSelectedMassimale(97)", "label="+ $Massimale_RCA_f
#
#    click "recalculate"
#    @selenium.wait_for_page_to_load $wait_for_page_to_load



#
#      premio1 = @selenium.get_text("b_v_int")
#      premio2 = @selenium.get_text("b_v_fract")
#      premio = premio1+premio2
      $Polizza_nuova_auto_usata ? premio = @selenium.get_text("//div[10]/table/tbody/tr[2]/td[4]/div/span/strong") : premio = @selenium.get_text("//div[9]/table/tbody/tr[2]/td[4]/div/span/strong")
      #premio = @selenium.get_text("//div[@id='customizedOffering']/table/tbody/tr[2]/td[4]/div/span/strong")
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio
      @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      raise RangeError, "Price cannot be nil" unless premio

   

      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    rescue Timeout::Error => ex
      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('GenialloydTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('GenialloydTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    end
	end 
	
	def select(element, label)
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_select(element, label)
	  @selenium.select element, label  	
	end
	
	def click(element)
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
	  wait_for_elm(element)
	  @selenium.click element 	
	end  
	
	def type(element, label)
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_elm(element)
	  @selenium.type element, label  	
	end      
  
  def wait_for_select(nome_elemento_combo, label)
    @last_element = nome_elemento_combo
  	sleep $sleep
  	if(nome_elemento_combo==nil)
  		@@logger.error('GenialloydTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
  	end
	if(label==nil)
  		@@logger.error('GenialloydTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
  	end
	label= label.gsub!("label=","")
	if(label==nil)
		@@logger.error('GenialloydTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
	end
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Label = "+label}
	  @selenium.wait_for_element nome_elemento_combo
	  var = @selenium.element? nome_elemento_combo
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }	
  end
  
  def wait_for_elm(nome_elemento)
    @last_element = nome_elemento
	  sleep $sleep
	  if(nome_elemento==nil)
		  @@logger.error('GenialloydTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
	  end	  
	  @selenium.wait_for_element nome_elemento
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
	  var = @selenium.element? nome_elemento
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
  end	
  
  def click_coperture(nome_elemento)
  	
    @last_element = nome_elemento
    sleep $sleep
    @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Click su elemento = "+ nome_elemento}
    if(nome_elemento==nil)
      @@logger.error('GenialloydTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
    end
      var = @selenium.element? nome_elemento
      if var
        if @selenium.is_checked nome_elemento
          @selenium.uncheck nome_elemento
        end
      else
      end

  end    
  
  def select_massimale(combo, recalculate)
	  @selenium.wait_for_element combo
	  lab = @selenium.get_selected_label combo
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
	  if (lab != $Massimale_RCA)
		  select combo, "label="+ $Massimale_RCA
		  click recalculate
		  @selenium.wait_for_page_to_load $wait_for_page_to_load 
	  end  	
  end   
  
  def const_publisher
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Cap	" + $Cap}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_nascita	" + $Data_nascita}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_nascita_giorno	" + $Data_nascita_giorno}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_nascita_mese	" + $Data_nascita_mese}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_nascita_anno	" + $Data_nascita_anno}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Comune_residenza  	" + $Comune_residenza}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Sesso	" + $Sesso}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Classe_BM	" + $Classe_BM}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Professione  	" + $Professione}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Marca_auto  	" + $Marca_auto}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Modello_auto  	" + $Modello_auto}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Allestimento_auto  	" + $Allestimento_auto}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$N_sinistri 	" + $N_sinistri}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$N_sinistri_ultimi_2_anni  	" + $N_sinistri_ultimi_2_anni}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_immatricolazione	" + $Data_immatricolazione}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_immatricolazione_giorno	" + $Data_immatricolazione_giorno}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_immatricolazione_mese	" + $Data_immatricolazione_mese}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_immatricolazione_anno	" + $Data_immatricolazione_anno}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Massimale_RCA " + $Massimale_RCA}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_decorrenza giorno " + $Data_decorrenza_giorno}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_decorrenza mese " + $Data_decorrenza_mese}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"$Data_decorrenza anno " + $Data_decorrenza_anno}
	  @@logger.debug('GenialloydTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
  end
end
