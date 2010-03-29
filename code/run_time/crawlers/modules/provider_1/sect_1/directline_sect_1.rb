#############################################
#   	Created by Kubepartners			          #
#                                           #
#				19/03/2010						              #
#############################################

class DirectlineSect1 < Test::Unit::TestCase
  attr_reader :selenium_driver, :suite_test
  alias :site :suite_test
  alias :page :selenium_driver

  FirstPolicy = 0..100
  Individual = 0..100

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

      @url = site.url
      @sleep = @kte.sleep_typing

      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Setting up Selenium Page ..."}
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Selenium port: #{@kte.port}"}
      @selenium_driver = Selenium::Client::Driver.new \
        :host => site.host,
        :port => site.port,
        :timeout_in_seconds => site.timeout_in_secs,
        :browser => site.browser,
        :url => @url

      @selenium_driver.start_new_browser_session

    rescue Errno::ECONNREFUSED => ex
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex.class.to_s} Selenium not started: #{ex.message.to_s}"} if @logger
      raise ex
    rescue Exception => ex
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex.class.to_s}: #{ex.message.to_s}"} if @logger
      raise ex
    end
  end

  def teardown
	  @selenium_driver.close_current_browser_session if @selenium_driver
    #    assert_equal [], @verification_errors
  end

  def test_site

    begin
      @last_element, @last_value, @one_driver_young = nil, nil, nil

      page_intro
      page_1
      page_2
      page_3
      page_4
      page_5
      page_6
      page_7
      page_premium

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

    open_page(@url)
    click_button "//img[@src='/images/bottone_lancio_preventivo-auto.gif']"
   	page_wait

  end
  
  def page_1

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    click_option(get('@insurance_situation'))
    (page.get_attribute("#{@last_element}@value") == "XX") ? click_option(get('@already_benefit_from_bersani')) : nil
    type_text("dataInizioValidita", @rate_date)
    type_text("Targa", get('@bersani_ref_vehicle_number_plate'))
    select_option "ConoscenzaAllState", get("@how_do_you_know_the_company")

    click_button "SUBMIT"
   	page_wait

  end

  def page_2

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    type_text("iddatadinascita", get('@birth_date'))
    click_option(get('@owner_sex'))
    select_option "idstatocivile", get("@civil_status")
    select_option "/qol/application/beans/vo/VoContraente.strCodProfessione", get("@job")
    type_text("CAP", get('@owner_zip_code'))
    select_option "/qol/application/beans/vo/VoContraente.strAnniPatente", get("@driving_license_yrs")
    click_option(get('@subscriber_is_driver'))
    click_option(get('@subscriber_is_owner'))

    click_button "SUBMIT"
   	page_wait

  end

  def page_3

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    select_option "numConducentiU26Dich", get("@driver_less_than_26_yrs")
    @last_value =~ /un conducente/i ? @one_driver_young = true : @one_driver_young = false
    type_text("Numauto", get('@family_car'))
    click_option(get('@family_members_insured_with_company'))

    click_button "SUBMIT"
   	page_wait

    page_more_drivers if @one_driver_young

  end

  def page_more_drivers

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    driver_birth_date = format_date(Chronic.parse("25 year ago tomorrow"))
    type_text("dataNascitaConducenteUno", driver_birth_date)
    click_option "//input[@name='sessoConducenteUno' and @value='#{get("@owner_specification")}']"
    select_option "/qol/application/beans/vo/VoConducenteUno.strCodStatoCivile", get("@civil_status")
    select_option "/qol/application/beans/vo/VoConducenteUno.strCodProfessione", get("@job")
    type_text("CAP", get('@owner_zip_code'))
    select_option "/qol/application/beans/vo/VoConducenteUno.strAnniPatente", "index=5"

    click_button "SUBMIT"
   	page_wait

  end

  def page_4

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}

    type_text("annoprimaimmatricolazione", get('@matriculation_date'))
    type_text("dataacquistoauto", get('@purchase_date_year'))
    select_option "select_marca", get("@make")
    page_click @last_element
    select_option "select_modelli", get("@model")

    if get('@insurance_situation') == 'id_radio_bm'
      select_option "classeProvenienzaAuto", get("@coming_from_bm")
      select_option "classeAssegnazioneAuto", get("@bm_assigned")
      click_option(get('@nr_of_yrs_insured_in_the_last_5_yrs'))
      click_option(get('@claims_total_number'))
    else
      click_option(get('@bersani'))
      if page.get_attribute("#{@last_element}@value") != "0"
        type_text("id_scadenzaPolizzaMadre", get('@bersani_policy_expiring_date'))
        select_option "sinistriRCA12MesiBMAge", get("@nr_of_paid_claims_this_yr")
        select_option "/qol/application/beans/vo/VoBMAgevolata.strClasseProvPolizzaMadre", get("@coming_from_bm")
      end
    end

    click_button "PROSEGUI"
   	page_wait

  end

  def page_5

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    page_click "allestimentoAuto"
    #    select_option "allestimentoAuto", get("@set_up")
    select_set_up "allestimentoAuto", get("@set_up")
    select_option "UsoPra", get("@habitual_vehicle_use")
    type_text("KMPercorsi", get('@km_per_yr'))
    click_option(get('@vehicle_use'))

    click_button "PROSEGUI"
   	page_wait

  end

  def page_6

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    select_option "iCodAntifurto", get("@alarm")
    select_option "iCodRicoveroNotturno", get("@vehicle_shelter")
    /^,00/.match(get_value("valoreauto")) ? type_text("valoreauto", get('@vehicle_value')) : nil
    
    click_button "SUBMIT"
   	page_wait

  end

  def page_7

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    click_button "AVANTI"
   	page_wait

  end

  def page_premium

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @last_element, @last_value = "@rca_on_off", get("@rca_on_off")
    case @last_value
    when 'on'
      select_option("SelM_RCA", get('@public_liability_indemnity_limit'))
      select_option("SelRateizzazione", get('@instalment')) #ATTENTION! Always use 1 year split
      select_option("SelFSM_RCA", get('@public_liability_exemption'))

      uncheck_checkbox(get('@protected_bonus_web_id')) if is_checked?(get('@protected_bonus_web_id'))
      uncheck_checkbox(get('@assistance_web_id')) if is_checked?(get('@assistance_web_id'))
      uncheck_checkbox(get('@legal_assistance_web_id')) if is_checked?(get('@legal_assistance_web_id'))
      uncheck_checkbox(get('@driver_accident_coverage_web_id')) if is_checked?(get('@driver_accident_coverage_web_id'))
      uncheck_checkbox(get('@contingency_protection_web_id')) if is_checked?(get('@contingency_protection_web_id'))
      uncheck_checkbox(get('@glasses_web_id')) if is_checked?(get('@glasses_web_id'))
      uncheck_checkbox(get('@kasko_web_id')) if is_checked?(get('@kasko_web_id'))
      uncheck_checkbox(get('@natural_events_act_of_vandalism_web_id')) if is_checked?(get('@natural_events_act_of_vandalism_web_id'))
      uncheck_checkbox(get('@theft_fire_coverage_web_id')) if is_checked?(get('@theft_fire_coverage_web_id'))

      click_button "RICALCOLA"
      sleep @sleep*3

      @last_element, @last_value = "@rca_premium_id", get("@rca_premium_id")
      wait_for_elm @last_value
      get_premium(get("@rca_premium_id"))
    else
      raise RangeError, "RC cover cannot be off"
    end

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
    assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i
  end


  def select_set_up(id, value = nil)
    @last_element, @last_value = id, (value =~ /index=/i)? value : "label=#{value.split("|")[0]}"
#    value_array = value.split("|")
#    @last_value = value_array[0]
#    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}
    page_select @last_element, "#{@last_value}"
    if /(seleziona)+/i.match(page.get_selected_label(@last_element))
      @last_value = "label=#{value.split("|")[1]}"
      page_select @last_element, "#{@last_value}"
    else
      nil
    end
#
     assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i
  end

  def type_text(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed text element: [#{@last_element}] with string value: [#{@last_value}]"}
    page_type @last_element, "#{@last_value}"
    assert_equal page.get_value(@last_element), @last_value
  end

  def get_value(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's getting value for element: [#{@last_element}]"}
    return page_value @last_element
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

	def page_value(element)
	  wait_for_elm(element)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => got value = #{page.get_value(element)} for element #{element}"}
	  return page.get_value element
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

  def get_premium(p)

    @last_element = p
    premium = page.get_text(@last_element)
    assert premium.split("€")[1] != nil, @last_element.inspect
    assert premium.split("€")[1].to_s.match(/[a-zA-Z]/) == nil, @last_element.inspect
    premium = premium.split("€")[1].gsub(".","")
    premium = premium.gsub(",",".")

    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => PREMIUM = € #{premium.to_s}"}
    assert_not_equal 0, premium.to_i, "Price cannot be equal to zero"
    @kte.rc_premium = premium

  end

end
