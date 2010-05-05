############################################
#   	Created by Kubepartners              #
#                                          #
#				19/03/2010                         #
#                                          #
#     modified: 26/04/2010                 #
#                                          #
############################################

class DirectlineSect1 < Test::Unit::TestCase
  attr_reader :selenium_driver, :suite_test
  alias :site :suite_test
  alias :page :selenium_driver

  SHARED = 'shared.rb'
  DLN_LIBRARY_PATH = File.join(File.dirname(__FILE__), '../..')

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
      @store_params = @kte.store_params

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
  require("#{DLN_LIBRARY_PATH}/#{SHARED}")
  include Shared

  def page_intro

    open_page(@url)
    click_button "//img[@alt='Per la tua auto']"
   	page_wait

  end
  
  def page_1

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    click_option(get('@privacy_1'))
    click_button "//img[@id='btnPrivacy']"

    page_click(get('@insurance_situation'))

    type_text("giornoDecorrenzaPolizza", @rate_date.slice(0,2))
    type_text("meseDecorrenzaPolizza", @rate_date.slice(3,2))
    type_text("annoDecorrenzaPolizza", @rate_date.slice(6,4))

    if get('@insurance_situation') =~ /bg_radio1/i
      click_option(get('@already_benefit_from_bersani'))

      page_click('classeBMProvenienza_link')
      page_click('//*[@id="classeBMProvenienza_list"]/li[@rel="'+get("@coming_from_bm")+'"]')
      page_click('classeBMAssegnazione_link')
      page_click('//*[@id="classeBMAssegnazione_list"]/li[@rel="'+get("@bm_assigned")+'"]')
      
      click_option(get('@claims_total_number'))
      click_option(get('@nr_of_yrs_insured_in_the_last_5_yrs'))

    else

      click_option(get('@bersani'))

      if get('@bersani') == 'usaAgevolazioneBersani_TRUE'
        click_option(get('@bersani_ref_vehicle_insured_with_company'))
        
        page_click('classeBMAssegnazione_link')
        page_click('//*[@id="classeBMAssegnazione_list"]/li[@rel="'+get("@bm_assigned")+'"]')
      end

      click_option('//input[@id="targaConosciuta_" and @name="motorQuoteModel.targaConosciuta" and @value="FALSE"]') #plate always checked 'no'

    end

    click_button "btnContinua"
   	page_wait

  end

  def page_2

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    type_text("policyHolder_bornDay", get('@birth_date_day'))
    type_text("policyHolder_bornMonth", get('@birth_date_month'))
    type_text("policyHolder_bornYear", get('@birth_date_year'))

    click_option('policyHolder_sex_'+get("@owner_sex")+'')

    page_click('policyHolder_maritalStatus_link')
    page_click('//*[@id="policyHolder_maritalStatus_list"]/li[@rel="'+get("@civil_status")+'"]')

    page_click('policyHolder_profession_link')
    page_click('//*[@id="policyHolder_profession_list"]/li[@rel="'+get("@job")+'"]')
    store_parameter(:job, page.get_text('policyHolder_profession_link')) if @store_params

    type_text("policyHolder_zipCode", get('@owner_zip_code'))

    enhanced_town_select('policyHolder_town_link',get("@residence"), "//*[@id='policyHolder_town_li_?']/span")

    page_click('policyHolder_drivingLicencePossess_link')
    page_click('//*[@id="policyHolder_drivingLicencePossess_list"]/li[@rel="'+get("@driving_license_yrs")+'"]')
    
    click_option(get('@subscriber_is_driver'))
    click_option(get('@subscriber_is_owner'))

    page_click('numeroConducentiMinori26Anni_link')
    page_click('//*[@id="numeroConducentiMinori26Anni_list"]/li[@rel="'+get("@driver_less_than_26_yrs")+'"]')
    
    if get("@driver_less_than_26_yrs") == '1'
      page_more_drivers
    end

    click_button "btnContinua"
   	page_wait

  end

  def page_more_drivers

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    type_text("under26First_bornDay", Chronic.parse("25 year ago tomorrow").strftime("%d"))
    type_text("under26First_bornMonth", Chronic.parse("25 year ago tomorrow").strftime("%m"))
    type_text("under26First_bornYear", Chronic.parse("25 year ago tomorrow").strftime("%Y"))

    click_option('under26First_sex_'+get("@owner_sex")+'')

    page_click('under26First_maritalStatus_link')
    page_click('//*[@id="under26First_maritalStatus_list"]/li[@rel="'+get("@civil_status")+'"]')

    page_click('under26First_profession_link')
    page_click('//*[@id="under26First_profession_list"]/li[@rel="'+get("@job")+'"]')

    type_text("under26First_zipCode", get('@owner_zip_code'))

    enhanced_town_select('under26First_town_link',get("@residence"), "//*[@id='under26First_town_li_?']/span")
    
    page_click('under26First_drivingLicencePossess_link')
    page_click('//*[@id="under26First_drivingLicencePossess_list"]/li[@rel="'+get("@driving_license_yrs")+'"]')

  end

  def page_3

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    type_text("mesePrimaImmatricolazioneVeicolo", get("@matriculation_date_month"))
    type_text("annoPrimaImmatricolazioneVeicolo", get("@matriculation_date_year"))

    type_text("annoAcquistoVeicolo", get("@purchase_date_year"))

    enhanced_make_select('marcaVeicolo_link', get("@make"), "//*[@id='marcaVeicolo_li_?']/span")
    store_parameter(:make, page.get_text('marcaVeicolo_link')) if @store_params

    enhanced_model_set_up_select('modelloVeicolo_link',get("@model"), "//*[@id='modelloVeicolo_li_?']/span")
    store_parameter(:model, page.get_text('modelloVeicolo_link')) if @store_params

    page_click('alimentazioneVeicolo_link')
    page_click('//*[@id="alimentazioneVeicolo_list"]/li[@rel="'+get("@fuel")+'"]')

    enhanced_model_set_up_select('allestimentoVeicolo_link', get("@set_up"), "//*[@id='allestimentoVeicolo_li_?']/span")
    store_parameter(:preparation, page.get_text('allestimentoVeicolo_link')) if @store_params

    page_click('tipoAntifurtoVeicolo_link')
    page_click('//*[@id="tipoAntifurtoVeicolo_list"]/li[@rel="'+get("@alarm")+'"]')

    page_click('usoAbitualeVeicolo_link')
    page_click('//*[@id="usoAbitualeVeicolo_list"]/li[@rel="'+get("@habitual_vehicle_use")+'"]')

    type_text("kmAnnuiPercorsiVeicolo", get('@km_per_yr'))

    click_option(get('@vehicle_use'))

    page_click('ricoveroVeicolo_link')
    page_click('//*[@id="ricoveroVeicolo_list"]/li[@rel="'+get("@vehicle_shelter")+'"]')

    if (page.get_value('valoreVeicolo') == "")
      type_text("valoreVeicolo", get('@vehicle_value'))
    end

    page_click('numeroVeicoliFamiliariPosseduti_link')
    page_click('//*[@id="numeroVeicoliFamiliariPosseduti_list"]/li[@rel="'+get("@family_car")+'"]')

    click_button "btnContinua"
   	page_wait

  end

  def page_4

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    click_button "btnContinua"

    page_click('fonti_link')
    page_click('//*[@id="fonti_list"]/li[@rel="'+get("@how_do_you_know_the_company")+'"]')
    
    click_button "//img[@alt='Vedi il premio']"
    page_wait

  end

  def page_premium

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    @last_element, @last_value = "@rca_on_off", get("@rca_on_off")
    case @last_value
    when 'on'

      page_click('RCA_LIMIT_0_link')
      if is_present?('//*[@id="RCA_LIMIT_0_list"]/li[@rel="'+get("@public_liability_indemnity_limit")+'"]')
        page_click('//*[@id="RCA_LIMIT_0_list"]/li[@rel="'+get("@public_liability_indemnity_limit")+'"]')
      else
        page_click('//*[@id="RCA_LIMIT_0_list"]/li[last()]')
      end

      page_click('RCA_DEDUCTIBLE_0_link')
      page_click('//*[@id="RCA_DEDUCTIBLE_0_list"]/li[@rel="'+get("@public_liability_exemption")+'"]')

      page_click('frazionamento_link')
      page_click('//*[@id="frazionamento_list"]/li[@rel="'+get("@instalment")+'"]')

      click_button(get('@protected_bonus_web_id')) if is_checked?(get('@protected_bonus_web_id'))
      uncheck_checkbox(get('@protected_bonus_web_id'))
      click_button(get('@theft_fire_coverage_web_id')) if is_checked?(get('@theft_fire_coverage_web_id'))
      uncheck_checkbox(get('@theft_fire_coverage_web_id'))
      click_button(get('@assistance_web_id')) if is_checked?(get('@assistance_web_id'))
      uncheck_checkbox(get('@assistance_web_id'))
      click_button(get('@legal_assistance_web_id')) if is_checked?(get('@legal_assistance_web_id'))
      uncheck_checkbox(get('@legal_assistance_web_id'))
      click_button(get('@driver_accident_coverage_web_id')) if is_checked?(get('@driver_accident_coverage_web_id'))
      uncheck_checkbox(get('@driver_accident_coverage_web_id'))
      click_button(get('@contingency_protection_web_id')) if is_checked?(get('@contingency_protection_web_id'))
      uncheck_checkbox(get('@contingency_protection_web_id'))
      click_button(get('@glasses_web_id')) if is_checked?(get('@glasses_web_id'))
      uncheck_checkbox(get('@glasses_web_id'))
      click_button(get('@kasko_web_id')) if is_checked?(get('@kasko_web_id'))
      uncheck_checkbox(get('@kasko_web_id'))
      click_button(get('@natural_events_act_of_vandalism_web_id')) if is_checked?(get('@natural_events_act_of_vandalism_web_id'))
      uncheck_checkbox(get('@natural_events_act_of_vandalism_web_id'))

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
    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
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

  def uncheck_checkbox(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's unchecked checkbox element: [#{@last_element}]"}
    page_uncheck @last_element  if is_present? @last_element
    sleep @sleep*2
  end

  def click_button(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's clicked button/item element: [#{@last_element}]"}
    page_click_button @last_element if is_present?(@last_element)
  end

  def is_checked?(id, value = nil)
    @last_element, @last_value = id, value
    present = is_present?(@last_element)
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => [#{@last_element}] checked? - #{page.is_checked(@last_element)}"} if present
    return present ? page.is_checked(@last_element) : nil
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

  def is_editable?(name)
	  present = page.is_editable name
    if present
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => field is editable?: #{present}"}
      visible = page.is_editable name
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => field is editable #{visible}"}
    end
    return present
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

  def wait_for_elm(name)
    sleep @sleep
    page.wait_for_element name
    assert_is_element_present(name)
  end

  def assert_is_element_present(element)
    assert page.element?(element) == true, "Wait for element failed! Element #{element} not present"
  end

  def get_premium(p)

    @last_element = p
    premium = page.get_text(@last_element)
    assert premium.split[1] != nil, @last_element.inspect
    assert premium.split[1].to_s.match(/[a-zA-Z]/) == nil, @last_element.inspect
    premium = premium.split("€")[0].gsub(".","")
    premium = premium.gsub(",",".")

    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => PREMIUM = € #{premium.to_s}"}
    assert_not_equal 0, premium.to_i, "Price cannot be equal to zero"
    @kte.rc_premium = premium

  end

  def enhanced_make_select(id, value, item)

    @last_element, @last_value, @matched = id, value, false
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed input element: [#{@last_element}] with value: [#{@last_value}]"}

    page_click(@last_element)
    span = find_span_element(item, @last_value.gsub("regexpi:",""), 0)
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's clicked item element: [#{span.gsub("regexpi:","")}]"} if @matched
    page_click(span) if @matched

    @matched ? @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value: [#{page.get_text(id)} for [#{@last_value.gsub("regexpi:","")}]"} : assert(page.get_text(id) =~ /#{@last_value.gsub("regexpi:","")}/i, page.get_text(id).inspect)
    page.key_press(id, "\\9")

  end

  def enhanced_model_set_up_select(id,value, item)

    @last_element, @last_value, @matched = id, value, false
    @alternate_car = false
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed input element: [#{@last_element}] with value: [#{@last_value}]"}

    page_click(@last_element)

    @last_value.split("|").each do |regex|
      span = find_span_element(item, regex.gsub("regexpi:",""), 0)
      @last_value = regex.gsub("regexpi:","")
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's clicked item element: [#{span}]"} if @matched
      page_click(span) if @matched
      break if @matched
      @alternate_car = true
      @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => First Model or Set-up not matched for profile [#{@kte.profile}] and record [#{@record}]! Using secondary regex value [#{@last_value}]"}
    end

    @matched ? @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value: [#{page.get_text(id)} for [#{@last_value}]"} : assert(page.get_text(id) =~ /#{@last_value}/i, page.get_text(id).inspect)
    page.key_press(id, "\\9")

  end

  def enhanced_town_select(id, value, item)

    @last_element, @last_value, @matched = id, value, false
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed input element: [#{@last_element}] with value: [#{@last_value}]"}

    page_click(@last_element)

    span = find_span_element(item, @last_value, 0)
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's clicked item element: [#{span}]"} if @matched
    page_click(span) if @matched

    @matched ? @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value: [#{page.get_text(id)} for [#{@last_value}]"} : assert(page.get_text(id) =~ /#{@last_value}/i, page.get_text(id).inspect)
    page.key_press(id, "\\9")

  end
  
end