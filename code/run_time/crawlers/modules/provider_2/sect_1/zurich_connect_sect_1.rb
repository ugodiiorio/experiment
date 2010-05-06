#############################################
#   	Created by Kubepartners			          #
#                                           #
#				17/03/2010						              #
#############################################

class ZurichConnectSect1 < Test::Unit::TestCase
  attr_reader :selenium_driver, :suite_test
  alias :site :suite_test
  alias :page :selenium_driver

  SHARED = 'shared.rb'
  DLN_LIBRARY_PATH = File.join(File.dirname(__FILE__), '../..')

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
      @last_element, @last_value, @first_time_insured = nil, nil, nil

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

    open_page(@url) #url="http://www.zurich-connect.it/default.aspx?Target=AssicurazioneAuto"

    click_button "//img[@alt='Fai il preventivo']"
    page_wait

  end

  def page_1

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    select_option("ddlFonteConoscenza", get("@how_do_you_know_the_company"))
    select_option("ddlFamiglia", get("@family_members_insured_with_company"))

    select_option("ddlSituazioneAssicurativa",get('@insurance_situation'))
    case page.get_selected_label(@last_element) =~ /prima volta/i
      when FirstTime
        @first_time_insured = true
        select_option("DropBersani1", get('@bersani'))
      else
      end

    type_text("txtDataDecorrenzaPolizza", @rate_date)
    type_text("txtDataScadenza", @rate_date)
    select_option("ddlContraenteProp", get("@subscriber_is_owner"))
    select_option("DDLNumeroCointestatari", get("@num_of_owners"))

    click_button "Avanti"
    page_wait

  end
  
  def page_2

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    click_option(get('@owner_sex'))
    page_wait
    case page.get_attribute("#{@last_element}@tabindex").to_i == 3
      when NotIndividual
      else
        type_text("txtDataNascita", get('@birth_date'))
        select_option("ddlNazionalita", get('@citizenship'))
        select_option("ddlstatociv2", get('@civil_status'))
        select_option("ddlTitoloStudio", get('@studies'))
        select_option("ddlprofessione", get('@job'))
        store_parameter(:job, page.get_selected_label(@last_element)) if @store_params
    end

    type_text("txtCapResidenza", fix_zip_code(get('@driver_zip_code')))
    click_button "btnLocalita"
    page_wait
    select_option("ddlLocalita", get('@residence'))

    click_button "Avanti"
    page_wait
    
  end

  def page_3

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    select_option("ddlAlimentazione", get('@fuel'))
    sleep @sleep*2
    select_option("ddlMeseImm", get('@matriculation_date_month'))
    sleep @sleep*2
    select_option("ddlAnno", get('@matriculation_date_year'))
    sleep @sleep*2
    select_option("ddlMarca", get('@make'))
    store_parameter(:make, page.get_selected_label(@last_element)) if @store_params
    sleep @sleep*2
    select_model_set_up("ddlModello", get('@model'))
    store_parameter(:model, page.get_selected_label(@last_element)) if @store_params
    sleep @sleep*2
    select_model_set_up("ddlAllestimento", get('@set_up'))
    store_parameter(:preparation, page.get_selected_label(@last_element)) if @store_params

    click_button "Avanti"
    page_wait

    select_option("ddlAntifurto", get('@alarm'))
    sleep @sleep*2
    type_text("txtValoriVeicoli", get('@vehicle_value'))
    type_text("txtValoriAccessori", get('@accesories_value'))
    select_option("ddlanti", get('@antiskid'))
    sleep @sleep*2
    select_option("ddlairbag", get('@airbag'))
    sleep @sleep*2
    select_option("ddlABS", get('@abs'))
    select_option("ddlStabiliz", get('@stabilizer'))
    sleep @sleep*2
    select_option("ddlGancioTraino", get('@tow_hook'))

    click_button "Avanti"
    page_wait
    
  end

  def page_4

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    case @first_time_insured
      when true
        select_option("ddlClasseUniversale", get('@bm_assigned'))
      else
        select_option("ddlClasseUniversale", get('@bm_assigned'))
        select_option("ddlNSinistriPen5anni", get('@claims_total_number'))
        page.get_selected_label(@last_element) =~ /1/i ? select_option("ddlUltimoBiennio", get('@first_claim_year')) : nil
        select_option("ddlAnniAssicurazione", get('@nr_of_yrs_insured_in_the_last_5_yrs'))
    end
    
    click_button "btnAvanti"
    page_wait
    
  end

  def page_5

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    click_button "//img[@alt='Calcola il premio']"
    page_wait

  end

  def page_premium

    @logger.warn("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @last_element, @last_value = "@rca_on_off", get("@rca_on_off")
    case @last_value
      when 'on'
        select_option("ddlTipoGuida", get('@driving_type'))
        select_option("ddlMassimaleRCA", get('@public_liability_indemnity_limit'))

        uncheck_checkbox(get('@road_assistance_web_id')) if is_checked?(get('@road_assistance_web_id'))
        uncheck_checkbox(get('@legal_assistance_web_id')) if is_checked?(get('@legal_assistance_web_id'))
        uncheck_checkbox(get('@driver_accident_coverage_web_id')) if is_checked?(get('@driver_accident_coverage_web_id'))
        uncheck_checkbox(get('@social_political_events_web_id')) if is_checked?(get('@social_political_events_web_id'))
        uncheck_checkbox(get('@glasses_web_id')) if is_checked?(get('@glasses_web_id'))
        uncheck_checkbox(get('@kasko_web_id')) if is_checked?(get('@kasko_web_id'))
        uncheck_checkbox(get('@natural_events_web_id')) if is_checked?(get('@natural_events_web_id'))
        uncheck_checkbox(get('@theft_fire_coverage_web_id')) if is_checked?(get('@theft_fire_coverage_web_id'))
        uncheck_checkbox(get('@driving_licence_withdrawal_guarantee_web_id')) if is_checked?(get('@driving_licence_withdrawal_guarantee_web_id'))
        uncheck_checkbox(get('@blukasko_web_id')) if is_checked?(get('@blukasko_web_id'))

        select_option("ddlFrazionamento", get('@instalment'))
        click_button "btnCalcola"
        page_wait

        @last_element, @last_value = "@rca_premium_id", get("@rca_premium_id")
#        wait_for_elm @last_value
#        assert !60.times{ break if (page.get_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_lblVisible_DA_Prize").split[0].to_s.match(/[a-zA-Z]/) == nil rescue false); sleep 1 }
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
#    assert_match(/#{@url.split("?")[0]}/i, page.get_location)
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

    p_array = p.split(" ")
    is_present?(p_array[1]) ? @last_element = p_array[1] : @last_element = p_array[0]
#    @last_element = p
    premium = page.get_text(@last_element)
    assert premium.split[0] != nil, @last_element.inspect
    assert premium.split[0].to_s.match(/[a-zA-Z]/) == nil, @last_element.inspect
    premium = premium.split[0].gsub(".","")
    premium = premium.gsub(",",".")

    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => PREMIUM = € #{premium.to_s}"}
    assert_not_equal 0, premium.to_i, "Price cannot be equal to zero"
    @kte.rc_premium = premium

  end

end
