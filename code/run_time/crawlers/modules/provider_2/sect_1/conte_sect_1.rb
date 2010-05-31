#############################################
#   	Created by Kubepartners			          #
#                                           #
#				26/03/2010						              #
#############################################

class ConteSect1 < Test::Unit::TestCase
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

      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Selenium host: #{site.host}"}
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Selenium port: #{site.port}"}
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Selenium timeout: #{site.timeout_in_secs}"}
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Selenium browser: #{site.browser}"}
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Selenium url: #{@url}"}
      @selenium_driver = Selenium::Client::Driver.new \
        :host => site.host,
        :port => site.port,
        :timeout_in_seconds => site.timeout_in_secs,
        :browser => site.browser,
        :url => @url

      @selenium_driver.start_new_browser_session
      @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => Setting up Selenium Page for profile [#{@kte.profile}] and record [#{@record}]"}

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
  end

  def test_site

    begin
      @last_element, @last_value = nil, nil

      page_intro
      page_1
      page_2
      page_3
      page_4
      page_5
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
    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
   	page_wait

  end

  def page_1

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    select_option "page:text_1CNSC", get("@how_do_you_know_the_company")
    click_option(get('@insurance_situation'))
    if (page.get_attribute("#{@last_element}@value") == "-1")
      click_option(get('@new_used_vehicle'))
    end

    click_button 'page:buttonContinua'
   	page_wait

  end

  def page_2

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    type_text("page:dataEffetto", @rate_date)
    select_option "page:mese_immatricolazione", get("@matriculation_date_month")
    type_text("page:anno_immatricolazione", get("@matriculation_date_year"))
    type_text("page:anno_acquisto", get("@purchase_date_year"))
    select_option "page:alimentazione", get("@fuel")
    select_option "page:marca", get("@make")
    store_parameter(:make, page.get_selected_label(@last_element)) if @store_params
    sleep @sleep*2
    select_model_set_up("page:modelloAuto", get("@model"))
    store_parameter(:model, page.get_selected_label(@last_element)) if @store_params
    sleep @sleep*2
    select_model_set_up("page:allestimento", get("@set_up"))
    store_parameter(:preparation, page.get_selected_label(@last_element)) if @store_params

    click_button 'page:continua_step01'
    sleep @sleep

    type_text("page:valore_veicolo", get('@vehicle_value')) if page.is_visible "page:valore_veicolo"
    page.fire_event 'page:valore_veicolo', 'blur' if page.is_visible "page:valore_veicolo"
    select_option "page:ricovero_notturno", get("@vehicle_shelter")
    select_option "page:antifurto", get("@alarm")
    select_option "page:uso_prevalente", get("@habitual_vehicle_use")
    select_option "page:km_anno", get("@km_per_yr")
    click_option(get('@modification_made'))
    click_option(get('@bersani'))
    select_option "page:classeCU", get("@bm_assigned")
    click_option(get('@subscriber_is_owner'))

    if (page.get_attribute("#{@last_element}@value") == "0")
      click_option(get('@client_type'))
    end

    click_option(get('@subscriber_is_driver'))

    click_button 'page:buttonContinua'
   	page_wait

  end

  def page_3

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    click_option(get('@driver_sex'))
    type_text("page:conducente_nascita", get('@birth_date'))
    click_option(get('@citizenship'))

    if get('@citizenship') == "page:conducente_nazione:0" #ITALIA
      select_option "page:provincia_di_nascita", get("@birth_province")
      type_keys("page:comune_di_nascita", get('@birth_place').to_s[0,1])
      wait_for_elm("//div[@id='risultatiSrchComNas']/ul/span/li")
      sleep @sleep*2
      type_keys("page:comune_di_nascita", get('@birth_place').to_s[1..-1])
      sleep @sleep*2
      page.click "//div[@id='risultatiSrchComNas']/ul/span/li"
      assert_equal page.get_value(@last_element).upcase, get('@birth_place').upcase
    else #ESTERO
      select_option "page:conducente_principale_nazione_estera", get("@birth_state")
      type_text("page:anno_residenza_italia", get('@italian_residence_starting_yrs'))
    end

    click_button 'page:buttonContinua'
    sleep @sleep

    select_option "page:provincia_di_residenza", get("@residence_province")

    type_keys("page:comune_di_residenza", get('@residence').to_s[0,1])
    wait_for_elm("//ul[@id='ulResult']/span[1]/li")
    sleep @sleep*2
    type_keys("page:comune_di_residenza", get('@residence').to_s[1..-1])
    sleep @sleep*2
    page.click "//ul[@id='ulResult']/span[1]/li"
    assert_equal page.get_value(@last_element).upcase, get('@residence').upcase

    type_text("page:toponimo_residenza", get('@toponym'))
    type_text("page:indirizzo_residenza", get('@address_street'))
    type_text("page:numero_residenza", get('@address_num'))
    select_option "page:cap_di_residenza", fix_zip_code(get("@owner_zip_code")), "value"

    click_button 'page:buttonContinua2'
    sleep @sleep

    type_keys("page:professione_conducente_principale", get('@job'))
    wait_for_elm("//div[@id='risultatiSrchProf']/ul/span/li")
    page.click "//div[@id='risultatiSrchProf']/ul/span/li"
    store_parameter(:job, page.get_value(@last_element)) if @store_params

    select_option "page:stato_civile", get("@civil_status")
    click_option(get('@cohabiting_children'))
    type_text("page:eta_conseguimento_patente", get('@driving_license_yrs'))
    page.focus @last_element
    page.fire_event(@last_element, 'blur')
    sleep @sleep*3

    if page.is_visible("page:anno_conseguimento_patente")
      @last_element = "page:anno_conseguimento_patente"
  	  @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{@last_element} value for profile [#{@kte.profile}] = #{page.get_value(@last_element)}"}
      if page.get_value(@last_element).to_i >= Time.now.year
        select_option("page:mese_conseguimento_patente", "index=#{Time.now.month}")
      else
        @last_element = "page:mese_conseguimento_patente"
        @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{@last_element} value = #{page.get_selected_value(@last_element)}"}
        @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => visible #{@last_element} text = #{page.get_selected_label(@last_element)}"}
      end
    end

    select_option "page:tipo_patente", get("@driving_license_type")
    select_option "page:punti_patente", get("@driving_license_points")

    click_button 'page:buttonContinua3'
    page_wait

  end

  def page_4

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    click_option(get('@drunkenness_fine'))
    click_option(get('@driving_license_suspension'))
    click_option(get('@other_vehicle_use'))

    is_present?("page:buttonContinua6") ? click_button("page:buttonContinua6") : click_button("page:buttonContinua198") if is_present?("page:buttonContinua198")
    sleep @sleep*2

    if page.is_visible(get('@claims_total_number'))
      click_option(get('@claims_total_number'))

      if (page.get_attribute("#{@last_element}@value") == "1")
        select_option "page:numero_sinistri_cc", get("@nr_of_paid_claims_2_yr")
        select_option "page:MeseSinistroConColpa1", get("@first_claim_month")
        select_option "page:AnnoSinistroConColpa1", get("@first_claim_year")

        if get("@nr_of_paid_claims_2_yr") == '2'
          select_option "page:MeseSinistroConColpa2", get("@second_claim_month")
          select_option "page:AnnoSinistroConColpa2", get("@second_claim_year")
        end

      end
    end

    click_button 'page:buttonContinua14' if is_present?("page:buttonContinua14")
    sleep @sleep

    type_text("page:cognome_contraente",get('@surname'))
    type_text("page:nome_contraente", get('@name') )
    type_text("page:email_contraente", get('@e_mail'))
    type_text("page:prefisso_cellulare_contraente", get('@mobile_prefix'))
    type_text("page:cellulare_contraente", get('@mobile_number'))

    click_button 'page:buttonContinua18' if is_present?("page:buttonContinua18")
    sleep @sleep

    click_option(get('@privacy_1'))

    click_button 'page:buttonContinua7_2'
    page_wait

  end

  def page_5

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    click_option(get('@driving_type'))
    click_option(get('@payment'))
    click_option('page:metodoDiPagamento2:0')

    click_button 'page:buttonCalcolaPremioAppoggio'
    page_wait

  end

  def page_premium

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    @last_element, @last_value = "@rca_on_off", get("@rca_on_off")
    case @last_value
      when 'on'
        is_present?("//span[@class='error']") ? raise(RangeError, "Verifica tecnica, chiamare Call Center => check birthdate year against driver license year!") : nil
        select_option("page:quota_info:0:massimaleRCA", get('@public_liability_indemnity_limit'))

#        uncheck_checkbox(get('@assistance_web_id')) if is_checked?(get('@assistance_web_id'))
#        uncheck_checkbox(get('@legal_assistance_web_id')) if is_checked?(get('@legal_assistance_web_id'))
#        uncheck_checkbox(get('@driver_accident_coverage_web_id')) if is_checked?(get('@driver_accident_coverage_web_id'))
#        uncheck_checkbox(get('@road_assistance_web_id')) if is_checked?(get('@road_assistance_web_id'))
#        uncheck_checkbox(get('@contingency_protection_web_id')) if is_checked?(get('@contingency_protection_web_id'))
#        uncheck_checkbox(get('@glasses_web_id')) if is_checked?(get('@glasses_web_id'))
#        uncheck_checkbox(get('@kasko_web_id')) if is_checked?(get('@kasko_web_id'))
#        uncheck_checkbox(get('@natural_events_act_of_vandalism_web_id')) if is_checked?(get('@natural_events_act_of_vandalism_web_id'))
#        uncheck_checkbox(get('@theft_fire_coverage_web_id')) if is_checked?(get('@theft_fire_coverage_web_id'))

#        page.fire_event 'page:quota_info:0:massimaleRCA', 'change'
        sleep @sleep*3
        if is_present?('page:ricalcola_but')
          click_button 'page:ricalcola_but'
          page_wait
        end

        sleep @sleep
        @last_element, @last_value = get("@rca_premium_id"), nil
        wait_for_elm @last_element
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
#    page.window_maximize
    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}
#    assert_match(/#{@url.split("?")[0]}/i, page.get_location)
  end

  def select_option(id, value, option = "label")
    @last_element, @last_value = id, (value =~ /index=/i)? value : "#{option}=#{value}"
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}
    page_select @last_element, "#{@last_value}"
    assert_equal page.get_selected_label(@last_element), value unless value =~ /regexpi/i unless value =~ /index=/i
  end

  def type_text(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed text element: [#{@last_element}] with string value: [#{@last_value}]"}
    page_type @last_element, "#{@last_value}"
    assert_equal page.get_value(@last_element), @last_value
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

  def page_keys(element, label)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Type on element = #{element} a string = #{label}"}
	  wait_for_elm(element)
    page.focus element
    page.key_up element, "\\115"
    sleep @sleep*2
	  page.type_keys element, label
	  page.type_keys element, " "
    page.key_press element, "\\8"
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
    assert_not_nil label.split("=")[1] #unless (label =~ /index=/i) unless (label =~ /value=/i)
	  wait_for_elm combo_name
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => combo is present: #{page.element? combo_name}"}
	  assert !60.times{ break if (page.get_select_options(combo_name).include?(label)); sleep 1 }	unless /(regexpi)*/.match(label)
  end

  def wait_for_elm(name)
  	sleep @sleep
	  page.wait_for_element name
    assert_is_element_present(name)
  end

  def is_present?(element)
    @last_element = element
	  present = page.is_element_present element
    if present
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element #{element} is present?: #{present}"}
      visible = page.is_visible element
      @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element #{element} is visible #{visible}"}
    end
    return present
  end

  def get_premium(p)

    @last_element = p
    premium = page.get_text(@last_element)
	  assert !60.times{ break if (premium.split[1]) != nil; sleep 1 }, @last_element.inspect
#    assert premium.split[1] != nil, @last_element.inspect
    assert premium.split[1].to_s.match(/[a-zA-Z]/) == nil, @last_element.inspect
    premium = premium.split[1]
    premium.count(",") > 0 ? premium = premium.gsub(".","") : nil
    premium = premium.gsub(",",".")

    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => PREMIUM = € #{premium.to_s}"}
    assert_not_equal 0, premium.to_i, "Price cannot be equal to zero"
    @kte.rc_premium = premium

  end

  def assert_is_element_present(element)
	  assert page.element?(element) == true, "Wait for element failed! Element not present = #{element}"
  end

end
