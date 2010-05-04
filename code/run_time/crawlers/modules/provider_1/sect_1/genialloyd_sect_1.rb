#############################################
#   	Created by Kubepartners			          #
#                                           #
#				23/03/2010						              #
#############################################

class GenialloydSect1 < Test::Unit::TestCase
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
#    assert_equal [], @verification_errors
  end

  def test_site

    begin
      @last_element, @last_value = nil, nil

      page_intro
      page_1
      page_2
      page_3
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
    click_button "//div[@id='autodiv']/form/input"
   	page_wait

  end

  def page_1

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    click_option(get('@insurance_situation'))
    if page.get_attribute("#{@last_element}@id") == "situazione3"
      click_option(get('@bersani'))
      type_text("targa2", get('@bersani_ref_vehicle_number_plate'))
    end

    click_option(get('@owner_sex'))
    type_text("loc", get('@owner_zip_code'))
    page.key_press("loc","\\9" )
    loc_array  = []
    sleep @sleep*2
    loc_array= page.get_select_options("sel_loc")
    if loc_array.size == 1
      nil
      else select_option "sel_loc", "index=1"
    end
#    select_option "sel_loc", "index=1"
    if get('@owner_specification')!="C"
      type_text("dataNasc", get('@birth_date'))
      select_option "paese", get("@citizenship")
      select_option "professione", get("@job")
      store_parameter(:job, page.get_selected_label(@last_element)) if @store_params
    end

    click_option(get('@driving_type'))
    select_option "comboFontePubblicitaria", get("@how_do_you_know_the_company")
    type_text("emailFascicolo", get('@e_mail'))

    click_button '//*[@value="Avanti"]'
   	page_wait

    if page.is_element_present('//div[@id="mb_contents"]/div[2]/a[2]')
      click_button '//div[@id="mb_contents"]/div[2]/a[2]'
     	page_wait
    end

  end

  def page_2

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    select_option "month", get("@matriculation_date_month")
    select_option "year", get("@matriculation_date_year")

    select_option "marca", get("@make")
    store_parameter(:make, page.get_selected_label(@last_element)) if @store_params
    sleep @sleep*2
    select_model_set_up("modello", get("@model"))
    store_parameter(:model, page.get_selected_label(@last_element)) if @store_params
    sleep @sleep*2
    select_model_set_up("selAllestimento", get("@set_up"))
    store_parameter(:preparation, page.get_selected_label(@last_element)) if @store_params
    click_option(get('@gas_methane_supply'))
    select_option "antifurto", get("@alarm")

    click_button '//input[@value="Avanti"]'
   	page_wait

  end

  def page_3

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    select_option "percorrenza", get("@km_per_yr")
    click_option(get('@vehicle_shelter'))
    click_option(get('@vehicle_use'))

    if get('@insurance_situation') != "situazione2"
      select_option "classeCU", get("@bm_assigned")
      select_option "sinistriUltimiAnni", get("@claims_total_number")
      select_option "sinistriUltimiDueAnni", get("@nr_of_paid_claims_1_yr")
    end

    type_text("date2", @rate_date)

    click_button '//input[@value="Avanti"]'
   	page_wait

  end

  def page_premium

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE URL: #{page.get_location}"}

    @last_element, @last_value = "@rca_on_off", get("@rca_on_off")
    case @last_value
      when 'on'
        sleep @sleep*2
        select_option("bean.codiceSelectedMassimale(97)", get('@public_liability_indemnity_limit'))
        click_option(get('@instalment'))

      # we take simple RCA premium value without considering all the other guarantees premiums

#        uncheck_checkbox(get('@assistance_web_id')) if is_checked?(get('@assistance_web_id'))
#        uncheck_checkbox(get('@legal_assistance_web_id')) if is_checked?(get('@legal_assistance_web_id'))
#        uncheck_checkbox(get('@driver_accident_coverage_web_id')) if is_checked?(get('@driver_accident_coverage_web_id'))
#        uncheck_checkbox(get('@contingency_protection_web_id')) if is_checked?(get('@contingency_protection_web_id'))
#        uncheck_checkbox(get('@glasses_web_id')) if is_checked?(get('@glasses_web_id'))
#        uncheck_checkbox(get('@kasko_web_id')) if is_checked?(get('@kasko_web_id'))
#        uncheck_checkbox(get('@natural_events_act_of_vandalism_web_id')) if is_checked?(get('@natural_events_act_of_vandalism_web_id'))
#        uncheck_checkbox(get('@theft_fire_coverage_web_id')) if is_checked?(get('@theft_fire_coverage_web_id'))

        click_button "b_recalculate"
        sleep @sleep*5

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
    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
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
    assert premium != nil, @last_element.inspect
    assert premium.to_s.match(/[a-zA-Z]/) == nil, @last_element.inspect
    premium = premium.gsub(".","")
    premium = premium.gsub(",",".")

    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => PREMIUM = € #{premium.to_s}"}
    assert_not_equal 0, premium.to_i, "Price cannot be equal to zero"
    @kte.rc_premium = premium

  end

end