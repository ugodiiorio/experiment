#############################################
#   	Created by Kubepartners			          #
#                                           #
#				13/03/2009						              #
#############################################

gem "selenium-client", ">=1.2.13"
require "selenium/client"

class GenertelTest < Test::Unit::TestCase
	
  def setup
    begin
      @@logger.info('GenertelTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Compagnia GENERTEL \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

      @garanzia = "1"
      @verification_errors = []
      const_publisher

      @@logger.debug('GenertelTest.setup => ' + $compagnia) {"Selenium port: "+ $port}
      @selenium= Selenium::Client::Driver.new \
        :host => "localhost",
        :port => $port,
        :browser => $browser,
        :url => "http://www.genertel.it",
        :timeout_in_seconds => $time_out

      @selenium.start_new_browser_session
      @selenium.set_context("test_new")
    rescue Errno::ECONNREFUSED => ex
      @@logger.error('GenertelTest.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
      raise ex
    rescue Exception => ex
#      @verification_errors[@verification_errors.size] = ex.message
      @@logger.error('GenertelTest.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
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
        #@selenium.set_speed 1000

        #il codice promozione dipende dal link di ingresso ... ed anche il superbounus e la classe BM
      if ($Flag_incidenti_2_anni =="si")
        @selenium.open "https://www.genertel.it/WEBsgw/start?CONV_CODE=vprev0001&TYPE_CODE=01&CALLERURL=http://www.genertel.it/assicurazioni/index.jhtml"
      else
        @selenium.open "https://www.genertel.it/WEBsgw/start?CONV_CODE=vprev0001&TYPE_CODE=01&CALLERURL=http://www.genertel.it/assicurazioni/index.jhtml&CONVENTION_CODE=WL9&SEGMENT_CODE=WL9&PROMO_CODE=WL9"
      end
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      click "LBLXDPOXClienteRbt1"

      if $Polizza_nuova_auto_nuova
        click $Situaziona_assicurativa = "RBTXDPOXSituazione1"   #veicolo nuovo no contratto bonus malus
      else
        if $Polizza_nuova_auto_usata
          click $Situaziona_assicurativa = "RBTXDPOXSituazione2"
        else
          click $Situaziona_assicurativa = "RBTXDPOXSituazione0"
        end
      end

      if !$Contratto_esistente then
        click "LBLXDPOXCUGenNoBersani"
        begin
            assert @selenium.is_text_present("Classe Genertel = 14")
        rescue Test::Unit::AssertionFailedError
            @verification_errors << $! + ' is_text_present("Classe Genertel = 14")'
            raise RangeError, "New contract, Classe Genertel must to be 14"
        end
      end

      if $Polizza_nuova_auto_nuova
      else
        if $Polizza_nuova_auto_usata
        else
          click "CBXXDPOXSinistri"
          type "CBXXDPOXSinistri", $N_sinistri_2_anni
          @selenium.key_up "CBXXDPOXSinistri", "\13"
          sleep 1
          click "//body/div[8]/div/div"
          sleep 2
#          raise RangeError, "Wrong claims selection" unless @selenium.get_text("LBLXCBXXDPOXSinistriVal").to_s == $N_sinistri_2_anni.to_s

#          click "//div[3]/div/div/div/div"                  #$N_sinistri_2_anni
#          @selenium.mouse_down("//div[3]/div/div/div/div")
#          sleep 3
#          @selenium.mouse_move_at("//div[3]/div/div/div/div", "#{$N_sinistri_2_anni.to_i*50 + 50},768")
#          sleep 3
#          @selenium.mouse_up("//div[3]/div/div/div/div")
#          sleep 3

          click "CBXXDPOXCUAssegnata"
          type "CBXXDPOXCUAssegnata", $Classe_BM.to_s
          @selenium.key_up "CBXXDPOXCUAssegnata", "\13"
          sleep 1
          click "//body/div[8]/div/div" if $Classe_BM.to_i > 1
          click "//body/div[8]/div/div[1]" if $Classe_BM.to_i == 1
          sleep 2
#          raise RangeError, "Wrong B/M selection" unless @selenium.get_text("LBLXDPOXCUGenertel") == $Classe_BM.to_s
          
#          click "//div[3]/div[2]/div[2]/div/div/div/div"    #$Classe_BM
#          @selenium.mouse_down("//div[3]/div[2]/div[2]/div/div/div/div")
#          sleep 3
#          @selenium.mouse_move_at("//div[3]/div[2]/div[2]/div/div/div/div", "#{$Classe_BM.to_i*20},768")
#          sleep 3
#          @selenium.mouse_up("//div[3]/div[2]/div[2]/div/div/div/div")
#          sleep 5
##          assert !60.times{ break if (@selenium.is_element_present("LBLXSLDXDPOXCUAssegnataVal") rescue false); sleep 1 }
#          raise RangeError, "Wrong Classe BM with slider selection" unless @selenium.get_text("LBLXSLDXDPOXCUAssegnataVal") == $Classe_BM

          click "//div[2]/div/div[2]/div/div/img" if $N_sinistri_2_anni == 0 and $Classe_BM == 1      #$Ultimi_2_anni_classe_1
          click "//div[5]/div/div/div/img"                  #Nessuna garanzia aggiuntiva
        end
      end

      type "DBXXDPOXDataDecorrenza", $Data_decorrenza                    #mm/dd/yyyy

      click "LBLXDPOXAvanti"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      type "NBXXDVEXAnnoImmat", $Data_immatricolazione_anno

      click "CBXXDVEXMarca"
      type "CBXXDVEXMarca", $Marca_auto #FORD #FIAT #VOLKSWAGEN
      @selenium.key_up "CBXXDVEXMarca", "\13"
      sleep 1
      click "//td[2]" #"//div[42]/table/tbody/tr/td[2]"
      raise RangeError, "Wrong car company selection" unless @selenium.get_value("CBXXDVEXMarca").upcase == $Marca_auto.upcase
#      @selenium.fire_event "CBXXDVEXMarca", "blur"

      click "CBXXDVEXModello"
      type "CBXXDVEXModello", $Modello_auto #FOCUS/FOCUS C-MAX #PANDA 2 SERIE #GOLF 5 SERIE
      @selenium.key_up "CBXXDVEXModello", "\13"
      sleep 1
      click "//body/div[8]/div/div"
      raise RangeError, "Wrong car model selection" unless @selenium.get_value("CBXXDVEXModello").upcase == $Modello_auto.upcase
#      @selenium.fire_event "CBXXDVEXModello", "blur"

      click "CBXXDVEXAllestimento"
      type "CBXXDVEXAllestimento", $Allestimento_auto #FOCUS C-MAX 1.6 TDCI (110CV) (07/2005) #PANDA 1.2 DYNAMIC (03/2005) #GOLF 2.0 16V TDI 5P. SPORTLINE (10/2003)
      @selenium.key_up("CBXXDVEXAllestimento", "\13")
      sleep 1
      click "//body/div[8]/div/div"
      raise RangeError, "Wrong car features selection" unless @selenium.get_value("CBXXDVEXAllestimento").upcase == $Allestimento_auto.upcase
#      @selenium.fire_event "CBXXDVEXAllestimento", "blur"

      type "NBXXDVEXValoreVeicolo", $Valore_commerciale

      click "CBXXDVEXAntifurto"
      type "CBXXDVEXAntifurto", $Tipologia_antifurto
      @selenium.key_up("CBXXDVEXAntifurto", "\13")
      sleep 1
      click "//body/div[8]/div/div" 
      raise RangeError, "Wrong car alarm selection" unless @selenium.get_value("CBXXDVEXAntifurto") == $Tipologia_antifurto
#      @selenium.fire_event "CBXXDVEXAntifurto", "blur"

      click $Optional_Airbag         #"//div[2]/div/div[1]/div/div/img"
#      click $Optional_Abs           #"//div[12]/div[2]/div/div[1]/div/div/img" must to be not selected
      click $Ricovero_notturno       #"//div[13]/div[2]/div/div[1]/div/div/img"
#      type "CBXXDVEXUso", "Privato"
      type "NBXXDVEXKmAnnui", $N_km

      click "LBLXDVEXAvanti"
      @selenium.wait_for_page_to_load $wait_for_page_to_load


      click "TBXXDP1XNome"
      type "TBXXDP1XNome", $Nome
      @selenium.fire_event "TBXXDP1XNome", "blur"

      click "TBXXDP1XCognome"
      type "TBXXDP1XCognome", $Cognome
      @selenium.fire_event "TBXXDP1XCognome", "blur"

      click $Sesso                        #"//div[4]/div[2]/div/div[1]/div/div/img" => M #"//div[4]/div[2]/div/div[2]/div/div/img" => F

      click "DBXXDP1XDataNascita"
      type "DBXXDP1XDataNascita", $Data_nascita                    #mm/dd/yyyy
      @selenium.fire_event "DBXXDP1XDataNascita", "blur"

      click "TBXXDP1XLuogoNascita"
      type "TBXXDP1XLuogoNascita", $Luogo_nascita.strip
#      type "TBXXDP1XLuogoNascita", "Cremona" if $Luogo_nascita.strip == "Prato"  #ATTENTION! Update profili_anagrafici table
#      type "TBXXDP1XLuogoNascita", "Roma" if $Luogo_nascita.strip == "Forlì"     #ATTENTION! Update profili_anagrafici table
      @selenium.fire_event "TBXXDP1XLuogoNascita", "blur"

      click "TBXXDP1XCodFisc"
      click "LBLXDP1XCalcCodFisc"
      sleep 5
      assert !60.times{ break if (@selenium.get_value("TBXXDP1XCodFisc").length == 16 rescue false); sleep 1 }
#      begin
#        assert @selenium.get_value("TBXXDP1XCodFisc").length == 16
#      rescue Test::Unit::AssertionFailedError
#        @verification_errors << $! + " TBXXDP1XCodFisc.length == 16"
      raise RangeError, "Not unique hometown" if @selenium.is_text_present("Seleziona il tuo luogo di nascita")
      raise RangeError, "Not unique hometown" if @selenium.is_text_present("Inserisci il tuo luogo di nascita")
#      end

      click "CBXXDP1XProfPrimoLiv"
      str = $Professione.split
      type "CBXXDP1XProfPrimoLiv", str[0]
      @selenium.key_up("CBXXDP1XProfPrimoLiv", "\13")
      sleep 1
      click "//body/div[8]/div/div" 
      raise RangeError, "Wrong job first selection" unless @selenium.get_value("CBXXDP1XProfPrimoLiv") == str[0]
#      @selenium.fire_event "CBXXDP1XProfPrimoLiv", "blur"

      click "CBXXDP1XProfSecondoLiv"
      type "CBXXDP1XProfSecondoLiv", str[1]
      @selenium.key_up("CBXXDP1XProfSecondoLiv", "\13")
      sleep 1
      click "//body/div[8]/div/div" 
      raise RangeError, "Wrong job second selection" unless @selenium.get_value("CBXXDP1XProfSecondoLiv") == str[1]
#      @selenium.fire_event "CBXXDP1XProfSecondoLiv", "blur"

      click "CBXXRSDXCodTopo"
      type "CBXXRSDXCodTopo", $Toponimo.upcase
      @selenium.key_up("CBXXRSDXCodTopo", "\13")
      sleep 1
      click "//body/div[9]/div/div[1]"
      raise RangeError, "Wrong toponym selection" unless @selenium.get_value("CBXXRSDXCodTopo").upcase == $Toponimo.upcase
#      @selenium.fire_event "CBXXRSDXCodTopo", "blur"

      click "TBXXRSDXIndirizzo"
      type "TBXXRSDXIndirizzo", $Indirizzo_via
      @selenium.fire_event "TBXXRSDXIndirizzo", "blur"
      click "TBXXRSDXNCiv"
      type "TBXXRSDXNCiv", $Indirizzo_num
      @selenium.fire_event "TBXXRSDXNCiv", "blur"
      click "TBXXRSDXComune"
      type "TBXXRSDXComune", $Comune_residenza.strip
      @selenium.fire_event "TBXXRSDXComune", "blur"

      click "CBXXRSDXProv"
      type "CBXXRSDXProv", $Provincia_residenza.strip.upcase
      @selenium.key_up("CBXXRSDXProv", "\13")
      sleep 1
      click "//body/div[10]/div/div"
      raise RangeError, "Wrong town selection" unless @selenium.get_value("CBXXRSDXProv").upcase == $Provincia_residenza.strip.upcase
#      @selenium.fire_event "CBXXRSDXProv", "blur"

      click "TBXXRSDXCAP"
      type "TBXXRSDXCAP", $Cap.strip
      @selenium.fire_event "TBXXRSDXCAP", "blur"

      click "CBXXRECXTipo1"
      type "CBXXRECXTipo1", $Phone_type
      @selenium.key_up("CBXXRECXTipo1", "\13")
      sleep 1
      click "//body/div[11]/div/div"
      raise RangeError, "Wrong phone type selection" unless @selenium.get_value("CBXXRECXTipo1") == "Cellulare"
#      @selenium.fire_event "CBXXRECXTipo1", "blur"

      click "TBXXRECXPrefisso1"
      type "TBXXRECXPrefisso1", $Mobile_prefisso
      @selenium.fire_event "TBXXRECXPrefisso1", "blur"
      click "TBXXRECXNumero1"
      type "TBXXRECXNumero1", $Mobile_suffisso
      @selenium.fire_event "TBXXRECXNumero1", "blur"

      click "TBXXRECXEmail"
      type "TBXXRECXEmail", $e_mail
      @selenium.fire_event "TBXXRECXEmail", "blur"

      click "LBLXAN1XAvanti"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      click $Flag_figli_conviventi                #"//div[4]/div[2]/div/div[2]/div/div/img"

      click "LBLXDCOXAvanti"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

#      begin
#        assert @selenium.get_text("GRDXRDAXGridRiepDatiPolizzaX4X0") == 'Nessuno' if $Contratto_esistente
#      rescue Test::Unit::AssertionFailedError
##        @verification_errors << $! + " GRDXRDAXGridRiepDatiPolizzaX4X0 == Nessuno"
#        raise RangeError, "Wrong claims number with slider selection"
#      end

      click "//img"
      click "//div[3]/div[2]/div/div[1]/div/div/img"
      click "//div[4]/div[2]/div/div[1]/div/div/img"

      click "CBXXINFXComeGenertel"
      type "CBXXINFXComeGenertel", $Conoscenza_Genertel
      @selenium.key_up("CBXXINFXComeGenertel", "\13")
      sleep 1
      click "//div[8]/div/div"
      raise RangeError, "Wrong Genertel knowledge first level" unless @selenium.get_value("CBXXINFXComeGenertel") == $Conoscenza_Genertel
#      @selenium.fire_event "CBXXINFXComeGenertel", "blur"

#      click "CBXXINFXComeGenertelSecLiv"
#      type "CBXXINFXComeGenertelSecLiv", $Conoscenza_Genertel
#      @selenium.key_up("CBXXINFXComeGenertelSecLiv", "\13")
#      sleep 1
#      click "//div[8]/div/div"
#      raise RangeError, "Wrong Genertel knowledge second level" unless @selenium.get_value("CBXXINFXComeGenertelSecLiv") == $Conoscenza_Genertel
#      @selenium.fire_event "CBXXINFXComeGenertelSecLiv", "blur"

      click "LBLXINFXConfermaDati"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      click "GRDXGARXGaranzieX1X3"
      type "GRDXGARXGaranzieX1X3", "€ " + $Massimale_RCA
      @selenium.key_up("GRDXGARXGaranzieX1X3", "\13")
      sleep 1
      click "//div[8]/div/div"
      raise RangeError, "Wrong selected Massimale RC" unless @selenium.get_value("GRDXGARXGaranzieX1X3") == "€ " + $Massimale_RCA
#      @selenium.fire_event "GRDXGARXGaranzieX1X3", "blur"

      click $Assistenza_stradale    #"//td[4]/div/div/div/img"



      str = $Assistenza_legale.split
      if $Classe_BM.to_i == 1 then
        click str[1]
      else
        click str[0]
      end
#      click $Assistenza_legale              #"//tr[4]/td[4]/div/div/div/img" or "//tr[6]/td[4]/div/div/div/img"

      click "LBLXAZIXRicalcolaTot" if @selenium.is_element_present("LBLXAZIXRicalcolaTot")
      
#      @selenium.click "GRDXGARXGaranzieX0X6"
      assert !60.times{ break if (@selenium.is_element_present("CVWXAZIXTotaleImp") rescue false); sleep 1 }
      begin
          assert @selenium.is_element_present("CVWXAZIXTotaleImp")
      rescue Test::Unit::AssertionFailedError
#          @verification_errors << $! + ' is_element_present("CVWXAZIXTotaleImp")'
          raise RangeError, "CVWXAZIXTotaleImp Price element is not present on the Final page"
      end

      click "LBLXAZIXAvanti"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      #      @selenium.click "LBLXRIEXImporto"
      begin
          assert @selenium.is_element_present("LBLXRIEXImporto")
      rescue Test::Unit::AssertionFailedError
#          @verification_errors << $! + ' is_element_present("LBLXRIEXImporto")'
          raise RangeError, "LBLXRIEXImporto Price element is not present on the Buy page"
      end

      premio = @selenium.get_text("LBLXRIEXImporto")
#      str = premio.split
#      premio = str[0]
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio
      @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      raise RangeError, "Price cannot be nil" unless premio

      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    rescue Timeout::Error => ex
      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('GenertelTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = ex.class.to_s + " => Selenium error after/on this element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('GenertelTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    end
	end 
	
	def select(element, label)
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_select(element, label)
	  @selenium.select element, label  	
	end
	
	def click(element)
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
	  wait_for_elm(element)
	  @selenium.click element 	
	end  
	
	def type(element, label)
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_elm(element)
	  @selenium.type element, label  	
	end     
  
  def wait_for_select(nome_elemento_combo, label)
    @last_element = nome_elemento_combo
  	sleep $sleep
  	if(nome_elemento_combo==nil)
  		@@logger.error('GenertelTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
  	end
	if(label==nil)
  		@@logger.error('GenertelTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
  	end
	label= label.gsub!("label=","")
	if(label==nil)
		@@logger.error('GenertelTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
	end
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Label = "+label}
	  	  
	  @selenium.wait_for_element nome_elemento_combo
	  var = @selenium.element? nome_elemento_combo
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
#	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }
  end
  
  def wait_for_elm(nome_elemento)
    @last_element = nome_elemento
	  sleep $sleep
	  if(nome_elemento==nil)
		  @@logger.error('GenertelTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
	  end	  
	  @selenium.wait_for_element nome_elemento
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
	  
	  var = @selenium.element? nome_elemento
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
  end	  
  
  def select_massimale(combo, recalculate)
	  @selenium.wait_for_element combo
	  lab = @selenium.get_selected_label combo
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
	  if (lab != $Massimale_RCA)
		  select combo, "label="+ $Massimale_RCA
		  click recalculate
		  @selenium.wait_for_page_to_load $wait_for_page_to_load 
	  end  	
  end  
  
  def const_publisher
		@@logger.debug('GenertelTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Comune_residenza	" +	$Comune_residenza}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Provincia_residenza  	" +	$Provincia_residenza}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Data_nascita	" +	$Data_nascita}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Data_nascita_giorno	" +	$Data_nascita_giorno}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Data_nascita_mese	" +	$Data_nascita_mese}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Data_nascita_anno	" +	$Data_nascita_anno}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Classe_BM	" +	$Classe_BM}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$N_sinistri_2_anni  	" +	$N_sinistri_2_anni}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Sesso	" +	$Sesso}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Cap	" +	$Cap}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Marca_auto  	" +	$Marca_auto}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Modello_auto  	" +	$Modello_auto}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Alimentazione  	" +	$Alimentazione}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Cilindrata  	" +	$Cilindrata}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Ultimi_2_anni_classe_1	" +	$Ultimi_2_anni_classe_1}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Data_immatricolazione	" +	$Data_immatricolazione}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Data_immatricolazione_giorno 	" +	$Data_immatricolazione_giorno}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Data_immatricolazione_mese	" +	$Data_immatricolazione_mese}
	  @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"	$Data_immatricolazione_anno	" +	$Data_immatricolazione_anno}
    @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Data_decorrenza_giorno = "+ 		$Data_decorrenza_giorno}
		@@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Data_decorrenza_mese = "+ 			$Data_decorrenza_mese}
    @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"Data_decorrenza_anno = "+ 			$Data_decorrenza_anno}
  end
end
