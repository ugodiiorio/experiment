#############################################
#   	Created by Kubepartners			          #
#                                           #
#				13/03/2009						              #
#############################################

gem "selenium-client", ">=1.2.13"
require "selenium/client"

class DialogoTest < Test::Unit::TestCase

  def setup
    begin
      @@logger.info('DialogoTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Compagnia DIALOGO \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

      @garanzia = "1"
      @verification_errors = []
      const_publisher

      @@logger.debug('DialogoTest.setup => ' + $compagnia) {"Selenium port: "+ $port}
      @selenium= Selenium::Client::Driver.new \
        :host => "localhost",
        :port => $port,
        :browser => $browser,
        :url => "http://www.dialogo.it",
        :timeout_in_seconds => $timeout_in_sec

      @selenium.start_new_browser_session
      @selenium.set_context("test_new")
    rescue Errno::ECONNREFUSED => ex
      @@logger.error('DialogoTest.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
      raise ex
    rescue Exception => ex
#      @verification_errors[@verification_errors.size] = ex.message
      @@logger.error('DialogoTest.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
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
#      @selenium.set_speed 2000
#      @selenium.set_timeout(30000)
      @selenium.open "http://www.dialogo.it/DialogoInternet/home.faces"
      click "//img[@alt='Preventivo Auto in 5 click']"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      click "contentSubView:contentForm:knowledgeSelect"
      select "contentSubView:contentForm:knowledgeSelect", "label="+					$ConoscenzaCompagnia

      if $Polizza_nuova_auto_nuova
        click "//input[@name='contentSubView:contentForm:attualeSituazione' and @value='1']"
        type "contentSubView:contentForm:decorrenza", 								$Data_decorrenza
        click "//input[@name='contentSubView:contentForm:bonusMalusRadio' and @value='N']"		#no bersani
      else
        if $Polizza_nuova_auto_usata
          click "//input[@name='contentSubView:contentForm:attualeSituazione' and @value='2']"
          type "contentSubView:contentForm:decorrenza", 							$Data_decorrenza
          click "//input[@name='contentSubView:contentForm:bonusMalusRadio' and @value='N']"		#no bersani
        else
          click 																	$Situazione_assicurativa_BM
          type "contentSubView:contentForm:decorrenza", 							$Data_decorrenza
          select "contentSubView:contentForm:classeAssegnazioneCu", "label="+ 	$Classe_BM
          select "contentSubView:contentForm:sinistriCausati4", "label="+			$N_sinistri_4_anni
        end
      end

        click "contentSubView:contentForm:buttonNext"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      click  																			$Conducenti_Dialogo
        click 																			$Intestatario_Driver_Dialogo
      click 																			$Intestatario_Proprietario_Dialogo
      click 																			$Cointestazione_Dialogo
      click "//input[@name='contentSubView:contentForm:MFRProprietario' and @value='"+ $Sesso + "']"
      click																			$Proprietario_is_conducente
        type "contentSubView:contentForm:DataNascitaProprietario", 						$Data_nascita
        select "contentSubView:contentForm:AnniPatenteProprietario", "label="+			$N_anni_patente
        select "contentSubView:contentForm:ProfessioneProprietario", "label="+			$Professione
        select "contentSubView:contentForm:NazionalitaProprietario", "label="+			$Nazionalita
    #    type "contentSubView:contentForm:ZipCodeProprietario", 						$Cap_new


    #    click "contentSubView:contentForm:buttonNext"
    #    @selenium.wait_for_page_to_load $wait_for_page_to_load
    #
    #	if $Cap == "22063"
    #		sleep 5
    #	end
        type "contentSubView:contentForm:ZipCodeProprietario", 							$Cap
      @selenium.key_up "contentSubView:contentForm:ZipCodeProprietario", "\13"
    #	sleep 3
    #	click "contentSubView:contentForm:backPD"
    #	sleep 3
    #    click "contentSubView:contentForm:buttonNext"
    #    @selenium.wait_for_page_to_load $wait_for_page_to_load
      sleep 3
        click "contentSubView:contentForm:buttonNext"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      if $Polizza_nuova_auto_nuova
        type "contentSubView:vehicleForm:chooseAuto:registration", 							$Data_imm_classe_14_mese + "/" + $Data_decorrenza_anno
      else
        if $Polizza_nuova_auto_usata
          type "contentSubView:vehicleForm:chooseAuto:registration", 						$Data_immatricolazione_mese + "/" + $Data_immatricolazione_anno
        else
          type "contentSubView:vehicleForm:chooseAuto:registration", 						$Data_immatricolazione_mese + "/" + $Data_immatricolazione_anno
        end
      end

        select "contentSubView:vehicleForm:chooseAuto:brands", "label="+							$Marca_auto
      sleep 3
      select "contentSubView:vehicleForm:chooseAuto:models", "label="+							$Modello_auto
      sleep 3


      type "preparations", 																	$Allestimento_auto
        select "contentSubView:vehicleForm:chooseAuto:preparationsCombo", "label="+ 			$Allestimento_auto
        type "contentSubView:vehicleForm:chooseAuto:preparationsHidden", 						$Allestimento_auto

        type "contentSubView:vehicleForm:chooseAuto:kms", 											$N_km
        type "contentSubView:vehicleForm:chooseAuto:insurableValue", 								$Valore_auto
      click 																			$Ricovero_notturno
        click "contentSubView:vehicleForm:next"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      sleep 5
    #	click "contentSubView:detailForm:buttonNextImg_2"
    #	@selenium.wait_for_page_to_load $wait_for_page_to_load
      mywindow = "http://www.dialogo.it/DialogoInternet/pages/quote/quotationData.faces"
      @last_element = mywindow
      @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Open in a new browser window the page " + mywindow}
      @selenium.open_window mywindow, "myWindow"
#      @selenium.open_window "","myWindow"
      @selenium.select_window "myWindow"
#      @selenium.wait_for_page_to_load $wait_for_page_to_load

      sleep 3

    #	@selenium.wait_for_element "contentSubView:quotationTabletForm:proposalTable:0:platinumSelectBox"
    #	lab = @selenium.get_selected_label "contentSubView:quotationTabletForm:proposalTable:0:platinumSelectBox"
    #	@@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
    #	if (lab != $Massimale_RCA)
    #		select "contentSubView:quotationTabletForm:proposalTable:0:platinumSelectBox", "label="+ $Massimale_RCA
    #		click "buttonRecomputeImg"
    #		@selenium.wait_for_page_to_load $wait_for_page_to_load
    #	end

      wait_for_elm("contentSubView:quotationTabletForm:proposalTable:0:_id133")
      lab = @selenium.get_selected_label "contentSubView:quotationTabletForm:proposalTable:0:_id133"
      @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
      if (lab != $Massimale_RCA)
        select "contentSubView:quotationTabletForm:proposalTable:0:_id133", "label="+ $Massimale_RCA
        click "buttonRecomputeImg"
#        @selenium.wait_for_page_to_load $wait_for_page_to_load
        sleep 5
        wait_for_elm("//div[@id='sbox_Costo Annuale']/span")
      end


      uncheck "contentSubView:quotationTabletForm:proposalTable:1:_id147"
      uncheck "contentSubView:quotationTabletForm:proposalTable:2:_id147"
      uncheck "contentSubView:quotationTabletForm:proposalTable:3:_id147"
      uncheck "contentSubView:quotationTabletForm:proposalTable:7:_id147"

      click "buttonRecomputeImg"

      sleep 5
      wait_for_elm("//div[@id='sbox_Costo Annuale']/span")

    #	premio = @selenium.get_text("//div[@id='sbox_RCA']/span")
      premio = @selenium.get_text("//div[@id='sbox_Costo Annuale']/span")
    #	premio = @selenium.get_text("contentSubView:quotationTabletForm:proposalTable:0:platinumPremium")
      str = premio.split
      premio = str[1]
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio
      @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      raise RangeError, "Price cannot be nil" unless premio

      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    rescue Timeout::Error => ex
      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('DialogoTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('DialogoTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    end
	end 
	
	def select(element, label)
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_select(element, label)
	  @selenium.select element, label  	
	end
	
	def click(element)
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
	  wait_for_elm(element)
	  @selenium.click element 	
	end  
	
	def type(element, label)
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_elm(element)
	  @selenium.type element, label  	
	end    
  
  def wait_for_select(nome_elemento_combo, label)
    @last_element = nome_elemento_combo
  	sleep $sleep
  	if(nome_elemento_combo==nil)
  		@@logger.error('DialogoTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
      raise RangeError, "Wait for select failed! Element cannot be nil"
  	end
    if(label==nil)
      @@logger.error('DialogoTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
      raise RangeError, "Wait for select failed! Label cannot be nil"
      end
    label= label.gsub!("label=","")
    if(label==nil)
      @@logger.error('DialogoTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
      raise RangeError, "Wait for select failed! Label cannot be nil"
    end
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Label = "+label}
	  	  
	  @selenium.wait_for_element nome_elemento_combo
	  var = @selenium.element? nome_elemento_combo
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }	
  end
  
  def wait_for_elm(nome_elemento)
    @last_element = nome_elemento
	  sleep $sleep
	  if(nome_elemento==nil)
		  @@logger.error('DialogoTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
      raise RangeError, "Wait for element failed! Element cannot be nil"
	  end	  
	  @selenium.wait_for_element nome_elemento
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
	  
	  var = @selenium.element? nome_elemento
	  if var
      @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
    else
  	  @@logger.error('DialogoTest.test_new => ' + $compagnia) {"Elemento = "+nome_elemento +" non presente"}
      raise RangeError, "Wait for element failed! Element not present"
    end
  end	  
  
  def const_publisher ()
  	
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Sesso = "+ $Sesso}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Cap = "+ $Cap}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Data_immatricolazione = "+ $Data_immatricolazione}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Data_immatricolazione_anno = "+ $Data_immatricolazione_anno}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Data_immatricolazione_mese = "+ $Data_immatricolazione_mese}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Data_immatricolazione_giorno = "+ $Data_immatricolazione_giorno}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Professione = "+ $Professione}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Marca_auto = "+ $Marca_auto}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Modello_auto = "+ $Modello_auto}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Allestimento_auto = "+ $Allestimento_auto}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Classe_BM = "+ $Classe_BM}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"N_Sinistri_4_anni = "+ $N_sinistri_4_anni}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Massimale_RCA = "+ $Massimale_RCA}
	  @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
	  
  end
  
  def uncheck(nome_elemento)
    @last_element = nome_elemento
    sleep $sleep

    if(nome_elemento==nil)
      @@logger.error('DialogoTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
    end
      var = @selenium.element? nome_elemento
      if var
        if @selenium.is_checked nome_elemento
          @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Click su elemento = "+ nome_elemento}
          @selenium.uncheck nome_elemento
          sleep 2
        end
      else
      end
  end    
end

