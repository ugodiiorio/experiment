#############################################
#   	Created by Kubepartners		    #
#                                           #
#				22/03/2010  #
#############################################

class GenertelSect1 < Test::Unit::TestCase
  attr_reader :selenium_driver, :suite_test
  alias :site :suite_test
  alias :page :selenium_driver

  SHARED = 'shared.rb'
  DLN_LIBRARY_PATH = File.join(File.dirname(__FILE__), '../..')

  F4 = "\\115"
  NotIndividual = "C"
  Other = "Altro"
  CompanyType = "Societa' a responsabilita limitata"

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
      @store_params = @kte.store_params

      site.load_sector
      site.load_person

      @rc_cover_code, @kte.rc_cover_code = get('@rca_code'), get('@rca_code')
      @record, @kte.record = get('@record_id'), get('@record_id')
      @rate_date = format_date(@kte.rate_date)

#      vehicle_age = 1
#      @matriculation_date = Chronic.parse("#{vehicle_age} years before today")

      @url = site.url
      @sleep = @kte.sleep_typing
      @log_level = @kte.log_level

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
      @last_element, @last_value, @first_time_insured, @bersani = nil, nil, nil, nil

      page_intro
      page_1
      page_2
      page_3
      page_4
      page_5
      page_premium
      page_summary

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
  require("#{DLN_LIBRARY_PATH}/#{SHARED}")
  include Shared

  def page_intro
  
    open_page(@url) #url="http://www.genertel.it/assicurazioni/auto/genertel_web_classic.jhtml"
    click_button_item "link"
    page_wait

  end

  def page_1

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    click_option(get('@insurance_situation'))
    sleep @sleep*2

    case is_present?("LBLXDPOXCUGenNoBersani")
      when false
        fake_select_option("CBXXDPOXSinistri", get('@nr_of_paid_claims_2_yr'), "//body/div[8]/div/div", "LBLXCBXXDPOXSinistriVal")
        sleep @sleep
        fake_select_option("CBXXDPOXCUAssegnata", get('@bm_assigned'), "//body/div[8]/div/div", "LBLXDPOXCUGenertel")
        sleep @sleep
        if get('@nr_of_paid_claims_2_yr') == "0" && get('@bm_assigned') == "1"
          click_option(get('@bm_1_more_than_1_year'))
          sleep @sleep*2
          assert is_present?("HLPXDPOXClasseUnoXNota"), "Super Bonus Genertel must to be present" if @last_element =~ /ClasseUnoDomanda0/i
        end
        click_option(get('@current_policy_guarantee'))
      else
        @first_time_insured = true
        click_option(get('@bersani'))
        if @last_element =~ /Bersani0/i
          @bersani = true
          type_text("TBXXDPOXTargaVeicoloFam", get('@bersani_ref_vehicle_number_plate'))
          fake_select_option("CBXXDPOXCUAssegnataFam", get('@bm_assigned'), "//body/div[8]/div/div", "LBLXDPOXClasseGenBersani")
          click_option(get('@bersani_ref_vehicle_insured_with_company'))
        end
    end

    type_text("DBXXDPOXDataDecorrenza", @rate_date)
    page.check(get('@leasing')) if is_present?(get('@leasing'))
    click_checkbox(get('@leasing'))
    click_button_item "LBLXDPOXAvanti"
    page_wait

  end

  def page_2

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
    type_text("NBXXDVEXAnnoImmat", get('@matriculation_date_year'))

    fake_select_option("CBXXDVEXMarca", get('@make'), "//td[2]")
    store_parameter(:make, page.get_value("CBXXDVEXMarca")) if @store_params
    sleep @sleep*2
    type_model_set_up("CBXXDVEXModello", get('@model'), "//body/div[8]/div/div")
    store_parameter(:model, page.get_value("CBXXDVEXModello")) if @store_params
#    fake_select_option("CBXXDVEXModello", @last_value, "//body/div[8]/div/div")
    sleep @sleep*2
    type_model_set_up("CBXXDVEXAllestimento", get('@set_up'), "//body/div[8]/div/div")
    store_parameter(:preparation, page.get_value("CBXXDVEXAllestimento")) if @store_params
#    fake_select_option("CBXXDVEXAllestimento", get('@set_up'), "//body/div[8]/div/div")
    sleep @sleep
    fake_select_option("CBXXDVEXAlimentazione", get('@fuel'), "//body/div[8]/div/div")
    type_text("TBXXDVEXAllestimento", get('@set_up')) if is_present?("TBXXDVEXAllestimento")
    fake_select_option("CBXXDVEXPotenzaCv", get('@cv'), "//body/div[8]/div/div") if is_present?("CBXXDVEXPotenzaCv")
    type_text("NBXXDVEXValoreVeicolo", get('@vehicle_value'))
    fake_select_option("CBXXDVEXAntifurto", get('@alarm'), "//body/div[8]/div/div")

    page.check(get('@airbag')) if is_present?(get('@airbag'))
    click_checkbox(get('@airbag'))
    page.check(get('@abs')) if is_present?(get('@abs'))
    click_checkbox(get('@abs'))
    page.check(get('@vehicle_shelter')) if is_present?(get('@vehicle_shelter'))
    click_checkbox(get('@vehicle_shelter'))

    fake_select_option("CBXXDVEXUso", get('@vehicle_use'), "//body/div[10]/div/div")
    type_text("NBXXDVEXKmAnnui", get('@km_per_yr'))

    click_button_item "LBLXDVEXAvanti"
    page_wait
    
  end

  def page_3

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
    click_option(get('@client_type'))
    case get('@owner_specification')
      when NotIndividual
        type_text("TBXXDP1XRagSociale", "#{get('@surname')} #{get('@name')}")
        fake_select_option("CBXXDP1XNaturaGiuridica", CompanyType, "//body/div[8]/div/div")
        type_text("TBXXDP1XPartitaIva", get('@vat_number'))
      else
        type_text("TBXXDP1XNome", get('@name'))
        type_text("TBXXDP1XCognome", get('@surname'))
        click_option(get('@owner_sex'))
        type_text("DBXXDP1XDataNascita", get('@birth_date'))
        type_text("TBXXDP1XLuogoNascita", get('@birth_place'))
        click_button_item "LBLXDP1XCalcCodFisc"
        assert !60.times{ break if (page.get_value("TBXXDP1XCodFisc").length == 16 rescue false); sleep 1 }, "Missing or invalid Codice Fiscale"
        assert !page.is_text_present("Seleziona il tuo luogo di nascita"), "Attention! Not unique Hometown"
        assert !page.is_text_present("Inserisci il tuo luogo di nascita"), "Attention! Missing Hometown"
        @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Codice Fiscale: #{page.get_value("TBXXDP1XCodFisc")}"}
        fake_select_option("CBXXDP1XProfPrimoLiv", get('@job'), "//body/div[8]/div/div")
        sleep @sleep*2
        fake_select_option("CBXXDP1XProfSecondoLiv", get('@job_2'), "//body/div[8]/div/div") if is_present?("CBXXDP1XProfSecondoLiv")
        store_parameter(:job, page.get_value("CBXXDP1XProfPrimoLiv")) if @store_params
    end

    click_button_item get('@subscriber_is_owner')

    fake_select_option("CBXXRSDXCodTopo", get('@toponym'), "//body/div[8]/div/div")
    type_text("TBXXRSDXIndirizzo", get('@address_street'))
    type_text("TBXXRSDXNCiv", get('@address_num'))
    type_text("TBXXRSDXComune", get('@residence'))
    fake_select_option("CBXXRSDXProv", get('@residence_province'), "//body/div[9]/div/div")
    type_text("TBXXRSDXCAP", get('@owner_zip_code'))

    type_text("TBXXRECXPrefisso1", get('@mobile_prefix'))
    type_text("TBXXRECXNumero1", get('@mobile_number'))
    type_text("TBXXRECXEmail", get('@e_mail'))

    fill_in_parent_data_for_bersani if @bersani

    click_button_item "LBLXAN1XAvanti"
    sleep @sleep*5
    assert !is_present?("ERRXRSDXComuni"), "Attention! Wrong or Missing Residence"
    if is_present?("TBXXRSDXComune")
      if page.get_value("TBXXRSDXComune") != get('@residence')
        click_button_item("LBLXAN1XAvanti")      
        page_wait
      end
    end
    
  end

  def page_4

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    click_button_item get('@num_of_owners')
    click_button_item get('@subscriber_is_driver')
    click_button_item get('@cohabiting_children')
    click_button_item get('@driving_license_yrs')
    if @last_element =~ /div\[1\]/i
      click_button_item get('@driver_less_25_yrs_license_less_2_yrs')
    end
    sleep @sleep

    customary_driver_data if get('@owner_specification') == NotIndividual

    click_button_item "LBLXDCOXAvanti"
    page_wait
  end

  def page_5

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
    click_button_item get('@privacy_1')
    sleep @sleep
    click_button_item get('@privacy_2')
    sleep @sleep
    click_button_item get('@privacy_3')

    fake_select_option("CBXXINFXComeGenertel", get('@how_do_you_know_the_company'), "//div[8]/div/div")
    sleep @sleep
    click_button_item "LBLXINFXConfermaDati"
    page_wait

  end
  
  def page_premium

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    @last_element, @last_value = "@rca_on_off", get("@rca_on_off")
    case @last_value
      when 'on'
        sleep @sleep*2
        page.wait_for_element("LBLXCNAXChiudi")
        page.is_visible("LBLXCNAXChiudi") ? click_button_item("LBLXCNAXChiudi") : nil
        
        fake_select_option("GRDXGARXGaranzieX1X3", get('@public_liability_indemnity_limit'), "//body/div[8]/div/div")
        click_button_item(get('@road_assistance_web_id')) if is_present?(get('@road_assistance_web_id'))
        uncheck_checkbox(get('@road_assistance_web_id'))
        click_button_item(get('@legal_assistance_web_id').split[0]) if is_present?(get('@legal_assistance_web_id').split[0])
        uncheck_checkbox(get('@legal_assistance_web_id').split[0])
        click_button_item(get('@legal_assistance_web_id').split[1]) if is_present?(get('@legal_assistance_web_id').split[1])
        uncheck_checkbox(get('@legal_assistance_web_id').split[1])

        @last_element, @last_value = "LBLXAZIXRicalcolaTot", nil
        page.wait_for_element("LBLXAZIXRicalcolaTot")
        page.is_element_present("LBLXAZIXRicalcolaTot") ? click_button_item("LBLXAZIXRicalcolaTot") : nil
        assert !90.times{ break if (page.is_element_present("CVWXAZIXTotaleImp") rescue false); sleep 1 }, "CVWXAZIXTotaleImp Price element is not visible on the Final page"

        page.wait_for_element("LBLXAZIXAvanti")
        assert_equal page.get_value("GRDXGARXGaranzieX1X3"), get('@public_liability_indemnity_limit')
        page.is_element_present("LBLXAZIXAvanti") ? click_button_item("LBLXAZIXAvanti") : nil
        page_wait
      else
        raise RangeError, "RC cover cannot be off"
    end
    
  end

  def page_summary

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    @last_element, @last_value = "LBLXRGAXNomePacchetto", nil # get("@rca_premium_id") # ATTENTION!!!!!!!!!!!!!!!!!!!!!!
    wait_for_elm @last_element
#        assert is_present?("LBLXRGAXNomePacchetto"), "LBLXRGAXNomePacchetto Price element is not present on the Buy page"
    get_premium(@last_element)

  end
  
  def open_page(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's opened page element: [#{@last_element}]"}
    page.open @last_element
    sleep @sleep
    assert_match(/#{@url.split("?")[0]}/i, page.get_location)
    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
  end

  def select_option(id, value = nil)
    @last_element, @last_value = id, (value =~ /index=/i)? value : "label=#{value}"
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}
    page_select @last_element, "#{@last_value}"
    assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i
  end

  def type_text(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed text element: [#{@last_element}] with string value: [#{@last_value}]"}
    page_type @last_element, "#{@last_value}"
    assert_equal page.get_value(@last_element), @last_value
    page.fire_event @last_element, "blur"

  end

  def type_keys(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed text element: [#{@last_element}] with string value: [#{@last_value}]"}
    page_keys @last_element, @last_value
  end

  def click_option(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's checked option button element: [#{@last_element}]"}
    page_click @last_element
#    assert_equal page.get_value(@last_element), "on"
  end

  def click_checkbox(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's checked checkbox element: [#{@last_element}]"}
    page_click @last_element
  end

  def uncheck_checkbox(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's unchecked checkbox element: [#{@last_element}]"}
    page_uncheck @last_element if is_present? @last_element
    sleep @sleep*2
  end

  def click_button_item(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's clicked button/item element: [#{@last_element}]"}
    page_click_button_item @last_element if is_present?(@last_element)
  end

  def is_checked?(id, value = nil)
    @last_element, @last_value = id, value
    present = is_present?(@last_element)
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => [#{@last_element}] checked? - #{page.is_checked(@last_element)}"} if present
  	return present ? page.is_checked(@last_element) : nil
  end

  def type_model_set_up(id, value, item)

    @last_element, @last_value, @matched = id, value, false
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed input element: [#{@last_element}] with value: [#{@last_value}]"}

    @alternate_car = false
    page.focus(@last_element)
    page.type(@last_element, " ")
    sleep @sleep
    page.key_press(@last_element, "\\8")
    page.key_up(@last_element, F4)
    sleep @sleep*2

    item = "//body/div[9]/div/div" unless is_present?(item)
    @last_value.split("|").each do |regex|
      model_set_up = find_text_element(item, regex)
      @last_value = regex
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's clicked item element: [#{item}]"} if @matched
      click_button_item(model_set_up, @last_value) if @matched
      break if @matched
      @alternate_car = true
      @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => First Model or Set-up not matched for profile [#{@kte.profile}] and record [#{@record}]! Using secondary regex value [#{@last_value}]"}
    end
    @matched ? @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value: [#{page.get_value(id)} with [#{@last_value}]"} : assert(page.get_value(id) =~ /#{@last_value}/i, page.get_value(id).inspect)
    page.key_press(id, "\\9")

  end

  def fake_select_option(id, value, item, assert_item = nil)

    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed input element: [#{@last_element}] with value: [#{@last_value}]"}
    case page.is_editable(@last_element)
      when true
      type_text(@last_element, @last_value)
      page.key_up(@last_element, F4)
      sleep @sleep
      click_button_item(item, @last_value)
      case item
        when "//body/div[8]/div/div"
          item = "//body/div[9]/div/div"
          click_button_item(item, @last_value) if is_present?(item)
        when "//body/div[9]/div/div"
          item = "//body/div[10]/div/div"
          click_button_item(item, @last_value) if is_present?(item)
        else
      end
      sleep @sleep*2
      if assert_item
        @last_element = assert_item
        wait_for_elm(@last_element)
        assert_equal page.get_text(@last_element), @last_value
      else
        assert page.get_value(id) =~ /#{@last_value}/i, page.get_value(id).inspect unless @matched
      end
    end

  end

  def page_wait
    page.wait_for_page_to_load site.wait_for_page_to_load
  end

	def page_click_button_item(element)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Click on button/item = #{element}"}
	  page.click element
	end

	def page_click(element)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Click on element = #{element}"}
	  wait_for_elm(element)
	  page.click element
#	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

	def page_uncheck(element)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Uncheck element = #{element}"}
	  page.uncheck element
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

	def page_type(element, label)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Type on element = #{element} a string = #{label}"}
	  wait_for_elm(element)
    page.focus element
	  page.type element, label
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

	def page_keys(element, label)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Type on element = #{element} a string = #{label}"}
	  wait_for_elm(element)
    page.focus element
	  page.type_keys element, label
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
	  assert !60.times{ break if (page.get_select_options(combo_name).include?(label)); sleep 1 }	unless label =~ /regexpi/i unless label =~ /index=/i
  end

  def wait_for_elm(name)
  	sleep @sleep
	  page.wait_for_element name
    assert_is_element_present(name)
  end

  def is_present?(name)
	  present = page.is_element_present name
    if present
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{name} is present?: #{present}"}
      visible = page.is_visible name
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{name} is visible #{visible}"}
    end
    return present
  end

  def assert_is_element_present(element)
	  assert page.element?(element) == true, "Wait for element failed! Element #{element} not present"
  end

  def fill_in_parent_data_for_bersani

    type_text("TBXXDABXNome", get('@name'))
    type_text("TBXXDABXCognome", get('@surname'))
    click_option(get('@driver_sex').split("|")[0])
    type_text("DBXXDABXDataNascita", get('@birth_date'))
    type_text("TBXXDABXLuogoNascita", get('@birth_place'))
    click_button_item "LBLXDABXCalcCodFisc"
    assert !60.times{ break if (page.get_value("TBXXDABXCodFisc").length == 16 rescue false); sleep 1 }, "Missing or invalid Codice Fiscale"
    assert !page.is_text_present("Seleziona il tuo luogo di nascita"), "Attention! Not unique hometown"
    assert !page.is_text_present("Inserisci il tuo luogo di nascita"), "Attention! Missing hometown"

  end

  def customary_driver_data

    type_text("TBXXDP3XNome", get('@name'))
    type_text("TBXXDP3XCognome", get('@surname'))
    get('@driver_sex').split("|").size < 2 ? raise(RangeError, "Missing or invalid driver sex!") : click_option(get('@driver_sex').split("|")[1])
    type_text("DBXXDP3XDataNascita", get('@birth_date'))
    type_text("TBXXDP3XLuogoNascita", get('@birth_place'))
    click_button_item "LBLXDP3XCalcCodFisc"
    assert !60.times{ break if (page.get_value("TBXXDP3XCodFisc").length == 16 rescue false); sleep 1 }, "Missing or invalid Codice Fiscale!"
    assert !page.is_text_present("Seleziona il tuo luogo di nascita"), "Attention! Not unique Hometown"
    assert !page.is_text_present("Inserisci il tuo luogo di nascita"), "Attention! Missing Hometown"
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Codice Fiscale: #{page.get_value("TBXXDP3XCodFisc")}"}

  end

  def get_premium(p)

    @last_element = p
    premium = page.get_text(@last_element).split(',').slice(1)
    premium = premium.split[1]
    assert premium != nil, @last_element.inspect
    assert premium.to_s.match(/[a-zA-Z]/) == nil, @last_element.inspect
    premium = premium.gsub(".","")
    premium = premium.gsub(",",".")

    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => PREMIUM = € #{premium.to_s}"}
    assert_not_equal 0, premium.to_i, "Price cannot be equal to zero"
    @kte.rc_premium = premium

  end

end
