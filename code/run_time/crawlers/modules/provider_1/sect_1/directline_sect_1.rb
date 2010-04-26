#############################################
#   	Created by Kubepartners			          #
#                                           #
#				19/03/2010                          #
#					                                  #
#     modified: 26/04/2010                  #
#                         	                #
#############################################

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

#    sleep @sleep*2
    click_option(get('@privacy_1'))
    click_button "//img[@id='btnPrivacy']"

    page.click(get('@insurance_situation'))

    if get('@insurance_situation') =~ /bg_radio1/i
      click_option(get('@already_benefit_from_bersani'))

      type_text("giornoDecorrenzaPolizza", @rate_date.slice(0,2))
      type_text("meseDecorrenzaPolizza", @rate_date.slice(3,2))
      type_text("annoDecorrenzaPolizza", @rate_date.slice(6,4))

      page.click('classeBMProvenienza_link')
      page.click(get("@coming_from_bm"))
      page.click('classeBMAssegnazione_link')
      page.click(get("@bm_assigned"))
      
      click_option(get('@claims_total_number'))
      click_option(get('@nr_of_yrs_insured_in_the_last_5_yrs'))

    else


    end


#    type_text("Targa", get('@bersani_ref_vehicle_number_plate'))
#    select_option "ConoscenzaAllState", get("@how_do_you_know_the_company")

    click_button "btnContinua"
   	page_wait

  end

  def page_2

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    type_text("policyHolder_bornDay", get('@birth_date_day'))
    type_text("policyHolder_bornMonth", get('@birth_date_month'))
    type_text("policyHolder_bornYear", get('@birth_date_year'))

    click_option(get('@owner_sex'))

    page.click('policyHolder_maritalStatus_link')
    page.click(get("@civil_status"))

    page.click('policyHolder_profession_link')
    page.click(get("@job"))

#    store_parameter(:job, page.get_selected_label(@last_element)) if @store_params
    type_text("policyHolder_zipCode", get('@owner_zip_code'))
#    type_text("policyHolder_town_link", get('@residence')) it's auto-compiled so we can comment this line

    page.click('policyHolder_drivingLicencePossess_link')
    page.click(get("@driving_license_yrs"))
    
    click_option(get('@subscriber_is_driver'))
    click_option(get('@subscriber_is_owner'))

    page.click('numeroConducentiMinori26Anni_link')
    page.click(get("@driver_less_than_26_yrs"))
    
    if get("@driver_less_than_26_yrs") == 'numeroConducentiMinori26Anni_li_2'
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

    click_option(get('@owner_sex')) #under26First_sex_MASCHIO   -    under26First_sex_FEMMINA

    page.click('under26First_maritalStatus_link')
    page.click(get("@civil_status"))

    page.click('under26First_profession_link')
    page.click(get("@job"))

#    store_parameter(:job, page.get_selected_label(@last_element)) if @store_params
    type_text("under26First_zipCode", get('@owner_zip_code'))

    page.click('under26First_drivingLicencePossess_link')
    page.click(get("@driving_license_yrs"))

  end

  def page_3

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    type_text("mesePrimaImmatricolazioneVeicolo", get("@matriculation_date_month"))
    type_text("annoPrimaImmatricolazioneVeicolo", get("@matriculation_date_year"))

    type_text("annoAcquistoVeicolo", get("@purchase_date_year"))

    enhanced_select "marcaVeicolo_link", get("@make")
#    store_parameter(:make, page.get_selected_label(@last_element)) if @store_params
#    sleep @sleep*2
#    page_click @last_element
    select_model_set_up "modelloVeicolo_link", get("@model")
#    store_parameter(:model, page.get_selected_label(@last_element)) if @store_params
    select_model_set_up "alimentazioneVeicolo_link", get("@fuel")
    select_model_set_up "allestimentoVeicolo_link", get("@set_up")
    select_model_set_up "tipoAntifurtoVeicolo_link", get("@alarm")

    select_option "usoAbitualeVeicolo_link", get("@habitual_vehicle_use")
    type_text("kmAnnuiPercorsiVeicolo", get('@km_per_yr'))
    click_option(get('@vehicle_use'))
    select_option "ricoveroVeicolo_link", get("@vehicle_shelter")

#    @last_value =~ /un conducente/i ? @one_driver_young = true : @one_driver_young = false
    type_text("valoreVeicolo", get('@vehicle_value'))

    type_text("numeroVeicoliFamiliariPosseduti_link", get('@family_car'))
#    click_option(get('@family_members_insured_with_company'))

    click_button "btnContinua"
   	page_wait

  end

  def page_4

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
    
#    if get('@insurance_situation') == 'id_radio_bm'
#      select_option "classeProvenienzaAuto", get("@coming_from_bm")
#      select_option "classeAssegnazioneAuto", get("@bm_assigned")
#      click_option(get('@nr_of_yrs_insured_in_the_last_5_yrs'))
#      click_option(get('@claims_total_number'))
#      #      type_text("dataacquistoauto", get('@purchase_date_year'))
#    elsif get('@insurance_situation') == '//input[@name="tipoPolizza" and @value="AU"]'
#      click_option(get('@bersani'))
#      if page.get_attribute("#{@last_element}@value") != "0"
#        #      type_text("dataacquistoauto", get('@purchase_date_year'))
#        type_text("id_scadenzaPolizzaMadre", get('@bersani_policy_expiring_date'))
#        select_option "sinistriRCA12MesiBMAge", get("@nr_of_paid_claims_this_yr")
#        select_option "/qol/application/beans/vo/VoBMAgevolata.strClasseProvPolizzaMadre", get("@bm_assigned")
#      end
#    elsif get('@insurance_situation') == '//input[@name="tipoPolizza" and @value="AN"]'
#      click_option(get('@bersani'))
#      if page.get_attribute("#{@last_element}@value") != "0"
#        #      type_text("dataacquistoauto", get('@purchase_date_year'))
#        type_text("id_scadenzaPolizzaMadre", get('@bersani_policy_expiring_date'))
#        select_option "sinistriRCA12MesiBMAge", get("@nr_of_paid_claims_this_yr")
#        select_option "/qol/application/beans/vo/VoBMAgevolata.strClasseProvPolizzaMadre", get("@bm_assigned")
#      end
#    end
#
#    type_text("annoprimaimmatricolazione", get('@matriculation_date'))
#    is_present?("dataacquistoauto") ? type_text("dataacquistoauto", get('@purchase_date_year')) : nil
#


    click_button "btnContinua"
    page_wait

    select_option "fonti_link", get("@how_do_you_know_the_company")
    click_button "//img[@alt='Vedi il premio']"
    page_wait

  end

  def page_5

#    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
#    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
#
#    page_click "allestimentoAuto"
#    #    select_option "allestimentoAuto", get("@set_up")
#    select_model_set_up "allestimentoAuto", get("@set_up")
#    store_parameter(:preparation, page.get_selected_label(@last_element)) if @store_params
#
#
#    click_button "PROSEGUI"
#    page_wait

  end

  def page_6

#    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
#    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
#
#    is_editable?("iCodAntifurto") ? (select_option "iCodAntifurto", get("@alarm"))  : nil
#    /^,00/.match(get_value("valoreauto")) ? type_text("valoreauto", get('@vehicle_value')) : nil
#
#    click_button "SUBMIT"
#    page_wait

  end

  def page_7

#    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
#    click_button "AVANTI"
#    page_wait

  end

  def page_premium

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    @last_element, @last_value = "@rca_on_off", get("@rca_on_off")
    case @last_value
    when 'on'
      select_max("RCA_LIMIT_0_link", get('@public_liability_indemnity_limit'))
      select_option("frazionamento_link", get('@instalment')) #ATTENTION! Always use 1 year split
      select_option("RCA_DEDUCTIBLE_0_link", get('@public_liability_exemption'))

      uncheck_checkbox(get('@protected_bonus_web_id')) if is_checked?(get('@protected_bonus_web_id'))
      uncheck_checkbox(get('@assistance_web_id')) if is_checked?(get('@assistance_web_id'))
      uncheck_checkbox(get('@legal_assistance_web_id')) if is_checked?(get('@legal_assistance_web_id'))
      uncheck_checkbox(get('@driver_accident_coverage_web_id')) if is_checked?(get('@driver_accident_coverage_web_id'))
      uncheck_checkbox(get('@contingency_protection_web_id')) if is_checked?(get('@contingency_protection_web_id'))
      uncheck_checkbox(get('@glasses_web_id')) if is_checked?(get('@glasses_web_id'))
      uncheck_checkbox(get('@kasko_web_id')) if is_checked?(get('@kasko_web_id'))
      uncheck_checkbox(get('@natural_events_act_of_vandalism_web_id')) if is_checked?(get('@natural_events_act_of_vandalism_web_id'))
      uncheck_checkbox(get('@theft_fire_coverage_web_id')) if is_checked?(get('@theft_fire_coverage_web_id'))

#      click_button "RICALCOLA"
#      sleep @sleep*3

#      @last_element, @last_value = "@rca_premium_id", get("@rca_premium_id")
#      wait_for_elm @last_value
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

  def select_option(id, value = nil)
    @last_element, @last_value = id, (value =~ /index=/i)? value : "label=#{value}"
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}
    page_select @last_element, "#{@last_value}"
    assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i
  end

#  def select_max(id, value = nil)
#    @last_element, @last_value = id, (value =~ /index=/i)? value : "label=#{value}"
#    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}
#    loc_array  = []
#    loc_array= page.get_select_options(@last_element)
#    if loc_array.size == 2
#      select_option @last_element, "index=1"
#    else page_select @last_element, "#{@last_value}"
#      assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i
#    end
#  end

#  def select_model_set_up(id, value)
#    @last_element, @last_value = id, (value =~ /index=/i)? value : value.split("|")[0]
#    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}
#
#    begin
#      page_select(@last_element, "label=#{@last_value}")
#    rescue Exception => ex
#      case value.split("|").size
#        when 1
#          raise ex
#        else
#          @last_value = "label=#{value.split("|")[1]}"
#          page_select @last_element, "#{@last_value}"
#      end
#    end
#
#    option_array =[]
#    option_array = page.get_select_options(@last_element)
#    @num_of_el = 0
#    index = 0
#    while index < option_array.length
#      @num_of_el  += 1
#      break if option_array[index] =~ /#{@last_value.gsub("regexpi:","")}/i
#      index += 1
#    end
#
#    @num_of_el == option_array.length ? (@last_value = "label=#{value.split("|")[1]}" ;  page_select @last_element, "#{@last_value}" ) : ( page_select @last_element, "label=#{@last_value}" )
#    assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i
#  end

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

  def enhanced_select(p,e)

    a = '//a[@id='+p+']/'+
    option_array =[]
    option_array = page.get_text(p)
    @num_of_el = 0
    index = 0
    while index < option_array.length
      @num_of_el  += 1
      break if option_array[index] =~ /#{e.gsub("regexpi:","")}/i
      index += 1
    end

    @num_of_el == option_array.length ? (@last_value = "label=#{value.split("|")[1]}" ;  page_click @last_element, "#{@last_value}" ) : ( page_select @last_element, "label=#{@last_value}" )
    assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i


  end

end