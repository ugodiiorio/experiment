#############################################
#   	Created by Kubepartners			          #
#                                           #
#				22/03/2010						              #
#############################################

class GenertelSect1 < Test::Unit::TestCase
  attr_reader :selenium_driver, :suite_test
  alias :site :suite_test
  alias :page :selenium_driver

  FirstTime = 0..100
  NotIndividual = true

  def get(var)
    var_value = site.instance_variable_get(var)
    return var_value.to_s.strip
  end

  def format_date(date)
    rate_date_day = "%02d" % date.day
    rate_date_month = "%02d" % date.month
    rate_date_year = "%02d" % date.year
    return "#{rate_date_day}/#{rate_date_month}/#{rate_date_year}"
  end

  def setup
    begin
      @suite_test = RunTest.new
      @suite_test.selenium_setup
      @kte = @suite_test.kte
      @logger = @kte.logger

      site.load_sector
      site.load_person

      @rc_cover_code, @kte.rc_cover_code = get('@rca_code'), get('@rca_code')
      @record, @kte.record = get('@record_id'), get('@record_id')
      @rate_date = format_date(@kte.rate_date)

#      vehicle_age = 1
#      @matriculation_date = Chronic.parse("#{vehicle_age} years before today")

      @url = site.url
      @sleep = @kte.sleep_typing
#      @verification_errors = []

      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Setting up Selenium Page ..."}
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Selenium port: #{@kte.port}"}
      @selenium_driver = Selenium::Client::Driver.new \
        :host => site.host,
        :port => site.port,
        :timeout_in_seconds => site.timeout_in_secs,
        :browser => site.browser,
        :url => @url

      @selenium_driver.start_new_browser_session
#      @selenium.set_context("test_new")

    rescue Errno::ECONNREFUSED => ex
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex.class.to_s} Selenium not started: #{ex.message.to_s}"} if @logger
      raise ex
    rescue Exception => ex
#      @verification_errors[@verification_errors.size] = ex.message
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex.class.to_s}: #{ex.message.to_s}"} if @logger
      raise ex
    end
  end


  def teardown
	  @selenium_driver.close_current_browser_session if @selenium_driver
  end

  def test_site

    begin
      @last_element, @last_value, @first_time_insured = nil, nil, nil

      page_intro
#      page_1
#      page_2
#      page_3
#      page_4
#      page_5
#      page_premium

      @kte.test_result = "Test OK => New RCA price for profile [#{@kte.profile}] and record [#{@record}]: € #{@kte.rc_premium}"
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => [#{@kte.test_result}]"}

      #@selenium.set_speed 2000
    rescue Timeout::Error => ex
      ex_message = "#{ex.class.to_s}: Selenium Timeout for profile [#{@kte.profile}] and record [#{@record}] on element -> [#{@last_element}] with value [#{@last_value if @last_value}]: #{ex.message.to_s}"
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex_message}"}
      @kte.test_result = ex_message
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = "#{ex.class.to_s}: Selenium error for profile [#{@kte.profile}] and record [#{@record}] on element -> [#{@last_element}] with value [#{@last_value if @last_value}]: #{ex.message.to_s}"
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex_message}"}
      @kte.test_result = ex_message
      raise ex.class, ex_message
    end
  end

  private # all methods that follow will be made private: not accessible for outside objects

  def page_intro
  
    open_page(@url) #url="https://www.genertel.it/WEBsgw/start?CONV_CODE=vprev0001&TYPE_CODE=01&CALLERURL=http://www.genertel.it/assicurazioni/index.jhtml&CONVENTION_CODE=WP0&SEGMENT_CODE=WP0&PROMO_CODE=WP0"
    page_wait

  end

  def page_1

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
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
        @selenium.key_up "CBXXDPOXSinistri", "\\115"
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
        @selenium.key_up "CBXXDPOXCUAssegnata", "\\115"
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
    @selenium.key_up "CBXXDVEXMarca", "\\115"
    sleep 1
    click "//td[2]" #"//div[42]/table/tbody/tr/td[2]"
    raise RangeError, "Wrong car company selection" unless @selenium.get_value("CBXXDVEXMarca").upcase == $Marca_auto.upcase
#      @selenium.fire_event "CBXXDVEXMarca", "blur"

    click "CBXXDVEXModello"
    type "CBXXDVEXModello", $Modello_auto #FOCUS/FOCUS C-MAX #PANDA 2 SERIE #GOLF 5 SERIE
    @selenium.key_up "CBXXDVEXModello", "\\115"
    sleep 1
    click "//body/div[8]/div/div"
    raise RangeError, "Wrong car model selection" unless @selenium.get_value("CBXXDVEXModello").upcase == $Modello_auto.upcase
#      @selenium.fire_event "CBXXDVEXModello", "blur"

    click "CBXXDVEXAllestimento"
    type "CBXXDVEXAllestimento", $Allestimento_auto #FOCUS C-MAX 1.6 TDCI (110CV) (07/2005) #PANDA 1.2 DYNAMIC (03/2005) #GOLF 2.0 16V TDI 5P. SPORTLINE (10/2003)
    @selenium.key_up("CBXXDVEXAllestimento", "\\115")
    sleep 1
    click "//body/div[8]/div/div"
    raise RangeError, "Wrong car features selection" unless @selenium.get_value("CBXXDVEXAllestimento").upcase == $Allestimento_auto.upcase
#      @selenium.fire_event "CBXXDVEXAllestimento", "blur"

    type "NBXXDVEXValoreVeicolo", $Valore_commerciale

    click "CBXXDVEXAntifurto"
    type "CBXXDVEXAntifurto", $Tipologia_antifurto
    @selenium.key_up("CBXXDVEXAntifurto", "\\115")
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
    @selenium.key_up("CBXXDP1XProfPrimoLiv", "\\115")
    sleep 1
    click "//body/div[8]/div/div"
    raise RangeError, "Wrong job first selection" unless @selenium.get_value("CBXXDP1XProfPrimoLiv") == str[0]
#      @selenium.fire_event "CBXXDP1XProfPrimoLiv", "blur"

    click "CBXXDP1XProfSecondoLiv"
    type "CBXXDP1XProfSecondoLiv", str[1]
    @selenium.key_up("CBXXDP1XProfSecondoLiv", "\\115")
    sleep 1
    click "//body/div[8]/div/div"
    raise RangeError, "Wrong job second selection" unless @selenium.get_value("CBXXDP1XProfSecondoLiv") == str[1]
#      @selenium.fire_event "CBXXDP1XProfSecondoLiv", "blur"

    click "CBXXRSDXCodTopo"
    type "CBXXRSDXCodTopo", $Toponimo.upcase
    @selenium.key_up("CBXXRSDXCodTopo", "\\115")
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
    @selenium.key_up("CBXXRSDXProv", "\\115")
    sleep 1
    click "//body/div[10]/div/div"
    raise RangeError, "Wrong town selection" unless @selenium.get_value("CBXXRSDXProv").upcase == $Provincia_residenza.strip.upcase
#      @selenium.fire_event "CBXXRSDXProv", "blur"

    click "TBXXRSDXCAP"
    type "TBXXRSDXCAP", $Cap.strip
    @selenium.fire_event "TBXXRSDXCAP", "blur"

    click "CBXXRECXTipo1"
    type "CBXXRECXTipo1", $Phone_type
    @selenium.key_up("CBXXRECXTipo1", "\\115")
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
    @selenium.key_up("CBXXINFXComeGenertel", "\\115")
    sleep 1
    click "//div[8]/div/div"
    raise RangeError, "Wrong Genertel knowledge first level" unless @selenium.get_value("CBXXINFXComeGenertel") == $Conoscenza_Genertel
#      @selenium.fire_event "CBXXINFXComeGenertel", "blur"

#      click "CBXXINFXComeGenertelSecLiv"
#      type "CBXXINFXComeGenertelSecLiv", $Conoscenza_Genertel
#      @selenium.key_up("CBXXINFXComeGenertelSecLiv", "\\115")
#      sleep 1
#      click "//div[8]/div/div"
#      raise RangeError, "Wrong Genertel knowledge second level" unless @selenium.get_value("CBXXINFXComeGenertelSecLiv") == $Conoscenza_Genertel
#      @selenium.fire_event "CBXXINFXComeGenertelSecLiv", "blur"

    click "LBLXINFXConfermaDati"
    @selenium.wait_for_page_to_load $wait_for_page_to_load

    click "GRDXGARXGaranzieX1X3"
    type "GRDXGARXGaranzieX1X3", "€ " + $Massimale_RCA
    @selenium.key_up("GRDXGARXGaranzieX1X3", "\\115")
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
        assert @selenium.is_element_present("LBLXRGAXNomePacchetto")
    rescue Test::Unit::AssertionFailedError
#          @verification_errors << $! + ' is_element_present("LBLXRIEXImporto")'
        raise RangeError, "LBLXRGAXNomePacchetto Price element is not present on the Buy page"
    end

    premio = @selenium.get_text("LBLXRGAXNomePacchetto").split(',').slice(1)
#      str = premio.split
    premio = premio.split[1]
    premio = premio.gsub(".","") if premio
    premio = premio.gsub(",",".") if premio
    @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
    raise RangeError, "Price cannot be nil" unless premio

    raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

    $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
    $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
    @@logger.debug('GenertelTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}

  end
	
  def open_page(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's opened page element: [#{@last_element}]"}
    page.open @last_element
    sleep @sleep
    assert_match(/#{@url.split("?")[0]}/i, page.get_location)
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
  end

  def select_option(id, value = nil)
    @last_element, @last_value = id, (value =~ /index=/i)? value : "label=#{value}"
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}
    page_select @last_element, "#{@last_value}"
    assert_equal page.get_selected_label(@last_element), @last_value unless /(regexpi)*/.match(@last_element)
  end

  def type_text(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed text element: [#{@last_element}] with string value: [#{@last_value}]"}
    page_type @last_element, "#{@last_value}"
    assert_equal page.get_value(@last_element), @last_value
  end

  def click_option(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's checked option button element: [#{@last_element}]"}
    page_click @last_element
    assert_equal page.get_value(@last_element), "on"
  end

  def click_checkbox(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's checked checkbox element: [#{@last_element}]"}
    page_click @last_element
    assert_equal page.get_value(@last_element), "on"
  end

  def uncheck_checkbox(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's unchecked checkbox element: [#{@last_element}]"}
    page_uncheck @last_element
    assert_equal page.get_value(@last_element), "off"
  end

  def click_button(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's clicked button element: [#{@last_element}]"}
    page_click_button @last_element
  end

  def is_checked?(id, value = nil)
    @last_element, @last_value = id, value
    present = is_present?(@last_element)
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => [#{@last_element}] checked? - #{page.is_checked(@last_element)}"} if present
  	return present ? page.is_checked(@last_element) : nil
  end

  def page_wait
   page.wait_for_page_to_load site.wait_for_page_to_load
  end

	def page_click_button(element)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Click on button = #{element}"}
	  page.click element
	end

	def page_click(element)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Click on element = #{element}"}
	  wait_for_elm(element)
	  page.click element
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

	def page_uncheck(element)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Uncheck element = #{element}"}
	  wait_for_elm(element)
	  page.uncheck element
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

	def page_type(element, label)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Type on element = #{element} a string = #{label}"}
	  wait_for_elm(element)
	  page.type element, label
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

	def page_select(element, label)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Select from combo = #{element} a #{label}"}
	  wait_for_select(element, label)
	  page.select element, label
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_selected_value(element)}"}
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => visible element text = #{page.get_selected_label(element)}"}
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => all element options = #{page.get_select_options(element)}"}
	end

  def wait_for_select(combo_name, label)
  	sleep @sleep
    assert_not_nil combo_name
    assert_not_nil label
    assert_not_nil label.gsub!("label=","") unless (label =~ /index=/i)
	  wait_for_elm combo_name
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => combo is present: #{page.element? combo_name}"}
	  assert !60.times{ break if (page.get_select_options(combo_name).include?(label)); sleep 1 }	unless /(regexpi)*/.match(label)
  end

  def wait_for_elm(name)
  	sleep @sleep
	  page.wait_for_element name
    assert_is_element_present(name)
  end

  def is_present?(name)
	  present = page.is_element_present name
    if present
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => checkbox is present?: #{present}"}
      visible = page.is_visible name
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => checkbox is visible #{visible}"}
    end
    return present
  end

  def get_premium(p)

    @last_element = p
    premium = page.get_text(@last_element)
    assert premium.split[0] != nil, @last_element.inspect
    assert premium.split[0].to_s.match(/[a-zA-Z]/) == nil, @last_element.inspect
    premium = premium.split[0].gsub(".","")
    premium = premium.gsub(",",".")

    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => PREMIUM = € #{premium.to_s}"}
    assert_not_equal 0, premium.to_i, "Price cannot be equal to zero"
    @kte.rc_premium = premium

  end

  def assert_is_element_present(element)
	  assert page.element?(element) == true, "Wait for element failed! Element not present = #{element}"
  end

end
