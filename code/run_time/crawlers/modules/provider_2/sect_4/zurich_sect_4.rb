#############################################
#   	Created by Kubepartners			          #
#                                           #
#				21/04/2010						              #
#############################################

class ZurichSect4 < Test::Unit::TestCase
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

      page_intro
      page_1
      page_2
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

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_location.upcase}"}

    open_page(@url)
    click_option(get('@privacy_1'))

    click_button '//input[@value="Step successivo"]'
   	page_wait

  end

  def page_1

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_location.upcase}"}

    select_option "tip_veic", get("@property_type_to_be_insured")
    select_option "frm_contr", get("@quotation")

    click_option(get('@owner_zip_code'))

    page.click 'buttonSIG_PROV'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "SIG_PROVDomini", get("@residence_province")
    page.click 'buttonSIG_PROV'
    page.select_window(nil)

    click_option(get('@type_of_contract'))

    page.click 'buttonFLG_RISC'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "FLG_RISCDomini", get("@insurance_situation")
    page.click 'buttonFLG_RISC'
    page.select_window(nil)

    if get("@quotation") != "FRANCHIGIA"
      click_option(get('@heir'))
    end

    click_button '//input[@value="Step successivo"]'
   	page_wait

  end

  def page_2

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_location.upcase}"}

    if get('@insurance_situation') =~ /proveniente/i
      click_option(get('@risk_certificate'))
    end

    if get("@quotation") != "FRANCHIGIA"

      page.click 'buttonCIP_CLAS'
      page.wait_for_pop_up('DominiPopup', 30000)
      page.select_window('DominiPopup')
      select_option "CIP_CLASDomini", get("@bm_assigned")
      page.click 'buttonCIP_CLAS'
      page.select_window(nil)

      type_text("NUM_SINI", get('@claims_total_number'))
      type_text("NUM_ANNI", get('@nr_of_yrs_without_claims'))

      type_text("QUIPES43", get('@full_load_total_weight'))

      if get("@quotation") =~ /claims/i
        type_text("COD_LIM1", get('@number_of_ni_na_yrs_during_5_yrs'))

        page.click 'buttonCOD_CLAS'
        page.wait_for_pop_up('DominiPopup', 30000)
        page.select_window('DominiPopup')
        select_option "COD_CLASDomini", 'index=0'
        page.click 'buttonCOD_CLAS'
        page.select_window(nil)
      else

        if is_present?('VAL_LIM1')
          type_text("VAL_LIM1", get('@claims_total_number'))
        end

        page.click 'buttonCOD_PEJU'
        page.wait_for_pop_up('DominiPopup', 30000)
        page.select_window('DominiPopup')
        select_option "COD_PEJUDomini", 'index=0'
        page.click 'buttonCOD_PEJU'
        page.select_window(nil)
      end

    else
      
      type_text("NUM_SINI", get('@nr_of_paid_claims_2_yr'))
      type_text("QUIPES43", get('@full_load_total_weight'))
      
      page.click 'buttonGAP_VAFR'
      page.wait_for_pop_up('DominiPopup', 30000)
      page.select_window('DominiPopup')
      select_option "GAP_VAFRDomini", get("@public_liability_exemption")
      page.click 'buttonGAP_VAFR'
      page.select_window(nil)

    end

    sleep @sleep*2

    page.click 'buttonMAX_SINI'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "MAX_SINIDomini", get("@public_liability_indemnity_limit")
    page.click 'buttonMAX_SINI'
    page.select_window(nil)
    sleep @sleep*2
    
    page.click 'buttonMERCI_A'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "MERCI_ADomini", get("@transportation_of_dangerous_goods_a")
    page.click 'buttonMERCI_A'
    page.select_window(nil)
    sleep @sleep*2

    page.click 'buttonMERCI_B'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "MERCI_BDomini", get("@transportation_of_dangerous_goods_b")
    page.click 'buttonMERCI_B'
    page.select_window(nil)
    sleep @sleep*2

    page.click 'buttonTRAS_MARMI'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "TRAS_MARMIDomini", get("@marble_blocks")
    page.click 'buttonTRAS_MARMI'
    page.select_window(nil)
    sleep @sleep*2

    page.click 'buttonCOD_TCMB'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "COD_TCMBDomini", get("@fuel")
    page.click 'buttonCOD_TCMB'
    page.select_window(nil)
    sleep @sleep*2

    page.click 'buttonCARICO_SCA'
    page.wait_for_pop_up('DominiPopup', 30000)
    page.select_window('DominiPopup')
    select_option "CARICO_SCADomini", get("@loading_unloading")
    page.click 'buttonCARICO_SCA'
    page.select_window(nil)
    sleep @sleep*2

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