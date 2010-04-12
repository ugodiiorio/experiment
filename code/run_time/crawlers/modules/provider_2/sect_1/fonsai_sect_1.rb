#############################################
#   	Created by Kubepartners			          #
#                                           #
#				12/04/2010						              #
#############################################

require 'gtk2'

class FonsaiSect1 < Test::Unit::TestCase
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
#    assert_equal [], @verification_errors
  end

  def test_site

    begin
      @last_element, @last_value = nil, nil

      page_1
#      page_2
#      page_3
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

  def page_1

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_location.upcase}"}

    open_page(@url)
   	page_wait

    select_option "vehicleSector", get('property_type_to_be_insured')
    select_option "tipoVeicolo", get('vehicle_type')
    select_option "usoVeicolo", get('vehicle_use')
    select_option "situation", get('@insurance_situation')
    click_button "input"
    page_wait

  end

  def page_2

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_location.upcase}"}

    select_option "tip_veic", get("@property_type_to_be_insured")
    select_option "frm_contr", get("@quotation")

    wait_for_elm('buttonCOD_MARC')
    page.click 'buttonCOD_MARC'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "COD_MARCDomini", get("@make")
    page.click 'buttonCOD_MARC'
    page.select_window(nil)

    page.click 'buttonCOD_MODE'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "COD_MODEDomini", get("@model")
    page.click 'buttonCOD_MODE'
    page.select_window(nil)

    if get("@model").match('altro') == nil
      page.click 'buttonCOD_ALLE'
      page.wait_for_pop_up('DominiPopup', 30000)
      page.select_window('DominiPopup')
      select_option "COD_ALLEDomini", get("@set_up")
      page.click 'buttonCOD_ALLE'
      page.select_window(nil)
    end

    click_option(get('@client_type'))
    if (page.get_attribute("#{@last_element}@id") == "TIP_PERS_F")
      click_option(get('@owner_sex'))
      select_option "gg_DAT_NASC", get("@birth_date_day")
      select_option "mm_DAT_NASC", get("@birth_date_month")
      select_option "aaaa_DAT_NASC", get("@birth_date_year")

      page.click 'buttonCODPRO35'
      page.wait_for_pop_up('DominiPopup', 30000)
      page.select_window('DominiPopup')
      select_option "CODPRO35Domini", get("@job")
      page.click 'buttonCODPRO35'
      page.select_window(nil)
    else
      page.click 'buttonCODPRO35'
      page.wait_for_pop_up('DominiPopup', 30000)
      page.select_window('DominiPopup')
      select_option "CODPRO35Domini", get("@denomination_company")
      page.click 'buttonCODPRO35'
      page.select_window(nil)
    end

    click_option(get('@type_of_contract'))

    page.click 'buttonFLG_RISC'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "FLG_RISCDomini", get("@insurance_situation")
    page.click 'buttonFLG_RISC'
    page.select_window(nil)

    click_option(get('@heir'))

    click_button 'Button2'
   	page_wait

  end

  def page_3

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_location.upcase}"}

    if get('@insurance_situation') =~ /proveniente/i
      click_option(get('@risk_certificate'))

      page.click 'buttonCIP_CLAS'
      page.wait_for_pop_up('DominiPopup', 30000)
      page.select_window('DominiPopup')
      select_option "CIP_CLASDomini", get("@bm_assigned")
      page.click 'buttonCIP_CLAS'
      page.select_window(nil)

      type_text("NUM_SINI", get('@claims_total_number'))
      type_text("SINANN86", get('@nr_of_paid_claims_1_yr'))
      type_text("COD_LIM1", get('@number_of_ni_na_yrs_during_5_yrs'))
    end

    if page.get_value("DES_MODE").match('')
      type_text("DES_MODE", get("@model"))
    end

    click_option(get('@fuel'))
    type_text("POT_FISC", get('@cv'))
    type_text("KW0_POTE", get('@kw'))

    page.click 'buttonMAX_SINI'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "MAX_SINIDomini", get("@public_liability_indemnity_limit")
    page.click 'buttonMAX_SINI'
    page.select_window(nil)

    click_option(get('@defined_drive'))
    click_option(get('@exclusive_drive'))
    click_option(get('@free_drive'))
    click_option(get('@tow_hook'))

    select_option "gg_DAT_1IMM", get("@matriculation_date_day")
    select_option "mm_DAT_1IMM", get("@matriculation_date_month")
    select_option "aaaa_DAT_1IMM", get("@matriculation_date_year")

    if page.get_value("KG0_MASS").match('')
      type_text("KG0_MASS", get("@full_load_total_weight"))
    end

    page.click 'buttonCODNAZ74'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "CODNAZ74Domini", get("@citizenship")
    page.click 'buttonCODNAZ74'
    page.select_window(nil)

    select_option "gg_DATDIN87", get("@birth_date_day")
    select_option "mm_DATDIN87", get("@birth_date_month")
    select_option "aaaa_DATDIN87", get("@birth_date_year")

    page.click 'buttonCODIDE82'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "CODIDE82Domini", get("@residence_province")
    page.click 'buttonCODIDE82'
    page.select_window(nil)

    page.click 'buttonCODIDE81'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "CODIDE81Domini", get("@residence")
    page.click 'buttonCODIDE81'
    page.select_window(nil)

    click_button 'step1'
   	page_wait

  end

  def page_premium

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_location.upcase}"}

    @last_element, @last_value = "@rca_on_off", get("@rca_on_off")
    case @last_value
      when 'on'
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
    premium = premium.split[1].gsub(".",",")

    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => PREMIUM = € #{premium.to_s}"}
    assert_not_equal 0, premium.to_i, "Price cannot be equal to zero"
    @kte.rc_premium = premium

  end

  def assert_is_element_present(element)
	  assert page.element?(element) == true, "Wait for element failed! Element not present = #{element}"
  end

end