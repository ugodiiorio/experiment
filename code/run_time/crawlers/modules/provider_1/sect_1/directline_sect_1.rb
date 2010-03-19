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

#      vehicle_age = 1
#      @matriculation_date = Chronic.parse("#{vehicle_age} years before today")

      @url = eval(site.url)
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
      page_2
      page_3
      page_4

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

    open_page(@url) #"http://www.directline.it/qol/application/preventivo/nq/InformazioniGenerali.jhtml;jsessionid=LYSWTWQKO0NA3QFIAEFCFFQ?risktype=REGL"

    click_option(get('@insurance_situation'))
    (page.get_attribute("#{@last_element}@value") == "XX") ? click_option(get('@bersani')) : nil
    type_text("dataInizioValidita", @rate_date)
    type_text("Targa", get('@bersani_ref_vehicle_number_plate'))
    select_option "ConoscenzaAllState", get("@how_do_you_know_the_company")


    click_button "SUBMIT"
   	sleep @sleep*3

  end

  def page_2


    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlBrand", get('@make'))

    type_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_txt1stPlate", get('@matriculation_date'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlModel", get('@model'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVersion", get('@set_up'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlFuelType", get('@fuel'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlKmPerYear", get('@km_per_yr'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVehicleUse", get('@habitual_vehicle_use'))

  end

#  def page_2
#
##      wait_for_alert()
#    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
#    click_option(get('@leasing'))
#
#    click_option(get('@client_type'))
#
#    case page.get_text("//label[@for='#{@last_element}']") =~ /fisica/i
#      when Individual
#        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlProvince", get('@residence_province'))
#        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlMunicipality", get('@residence'))
#        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlCountry", get('@citizenship'))
#        click_option(get('@owner_sex'))
#        type_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_txtBirthDate", get('@birth_date'))
#        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlJob", get('@job'))
#      else
#        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlProvince", get('@residence_province'))
#        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlMunicipality", get('@residence'))
#    end
#
#    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlInsuranceSituation", get('@insurance_situation'))
#    case page.get_selected_label(@last_element) =~ /prima polizza/i
#      when FirstPolicy
#        if Individual === (page.get_text("//label[@for='#{get('@client_type')}']") =~ /fisica/i)
#          select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlSelectBersani", get('@bersani'))
#          /(si)+/.match(page.get_selected_label(@last_element)) ? select_bersani : nil
#        end
#      else
#        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlCongenere", get('@coming_from_company'))
#        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlClassBonus", get('@bm_assigned'))
#        select_last_years_claims
#      end
#
#    type_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_txtDateEffect", @rate_date)
#
#    click_option(get('@driver_less_than_26_yrs'))
#
#    click_button "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward"
#    sleep @sleep*3
#
#  end

  def page_3

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    click_button "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward"
  	sleep @sleep*5

  end

  def page_4

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    case get("@rca_on_off")
      when 'on'
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddl_P01_Max", get('@public_liability_indemnity_limit'))
#        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddlChargeType", get('@instalment')) #ATTENTION! Always use 1 year split
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddlChargeType", get('@payment'))

        uncheck_checkbox(get('@assistance_web_id')) if is_checked?(get('@assistance_web_id'))
        uncheck_checkbox(get('@legal_assistance_web_id')) if is_checked?(get('@legal_assistance_web_id'))
        uncheck_checkbox(get('@driver_accident_coverage_web_id')) if is_checked?(get('@driver_accident_coverage_web_id'))
        uncheck_checkbox(get('@contingency_protection_web_id')) if is_checked?(get('@contingency_protection_web_id'))
        uncheck_checkbox(get('@glasses_web_id')) if is_checked?(get('@glasses_web_id'))
        uncheck_checkbox(get('@kasko_web_id')) if is_checked?(get('@kasko_web_id'))
        uncheck_checkbox(get('@natural_events_act_of_vandalism_web_id')) if is_checked?(get('@natural_events_act_of_vandalism_web_id'))
        uncheck_checkbox(get('@theft_fire_coverage_web_id')) if is_checked?(get('@theft_fire_coverage_web_id'))

        click_button "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnReCalculation"
      	sleep @sleep*2

        wait_for_elm get("@rca_premium_id")
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
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => is it checked checkbox: [#{@last_element}]?"}
    present = is_present?(@last_element)
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

  def select_bersani
    /(medesimo proprietario)+/.match(page.get_selected_label(@last_element)) ? select_last_years_claims : nil
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlClassBonus", get('@bm_assigned'))
  end

  def select_last_years_claims
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano1", get('@nr_of_paid_claims_5_yr'))
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano2", get('@nr_of_paid_claims_4_yr'))
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano3", get('@nr_of_paid_claims_3_yr'))
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano4", get('@nr_of_paid_claims_2_yr'))
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano5", get('@nr_of_paid_claims_1_yr'))
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano0", get('@nr_of_paid_claims_this_yr'))
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
		assert !30.times{ break if (! page.is_visible("ctl00_UpdateProgress1")); sleep 1; @logger.debug("#{__FILE__} => #{method_name}") \
                               {"#{@kte.company} => Waiting combo "+ name;} } \
                                if page.is_visible("ctl00_UpdateProgress1") \
                                if page.element? "ctl00_UpdateProgress1"
	  assert page.element?(element) == true, "Wait for element failed! Element not present = #{element}"
  end

end










































































































##############################################
##   	Created by Kubepartners			          #
##                                           #
##				19/03/2010						              #
##############################################
#
#gem "selenium-client", ">=1.2.13"
#require "selenium/client"
#
#class DirectLineTest < Test::Unit::TestCase
#
#  def setup
#    begin
#      @@logger.info('DirectLineTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
#      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("Compagnia DIRECTLINE \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#
#      @garanzia = "1"
#      @verification_errors = []
#      const_publisher
#
#      @@logger.debug('DirectLineTest.setup => ' + $compagnia) {"Selenium port: "+ $port}
#      @selenium= Selenium::Client::Driver.new \
#        :host => "localhost",
#        :port => $port,
#        :browser => $browser,
#        :url => "http://www.directline.it",
#        :timeout_in_seconds => $timeout_in_sec
#
#      @selenium.start_new_browser_session
#      @selenium.set_context("test_new")
#    rescue Errno::ECONNREFUSED => ex
#      @@logger.error('DirectLineTest.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
#      raise ex
#    rescue Exception => ex
##      @verification_errors[@verification_errors.size] = ex.message
#      @@logger.error('DirectLineTest.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
#      raise ex
#    end
#  end
#
#  def teardown
#    @selenium.close_current_browser_session #unless $selenium
#    assert_equal [], @verification_errors
#  end
#
#  def test_new
#
#    begin
#      @last_element = nil
#      @selenium.open "/index.jhtml?page=/index.jhtml"
#      click "btn_link_clicca_qui"
#      @selenium.wait_for_page_to_load $wait_for_page_to_load
#
#      #click "//input[@name='tipoPolizza' and @value='AU']"
#      #
#      if $Polizza_nuova_auto_nuova
#        click													"//input[@name='tipoPolizza' and @value='AN']"      #Polizza nuova
#      else
#        if $Polizza_nuova_auto_usata
#          click 												"//input[@name='tipoPolizza' and @value='AU']"
#        else
#          click 																$Situazione_assicurativa
#          click 																$Situazione_assicurativa_bersani
#        end
#      end
#
#        type "dataInizioValidita", 													$Data_decorrenza
#        select "ConoscenzaAllState", "label="+										$Conoscenza_compagnia
#        click "SUBMIT"
#        @selenium.wait_for_page_to_load $wait_for_page_to_load
#
#      type "datadinascita", 														$Data_nascita
#        click "//input[@name='sessoContraente' and @value='"+ 						$Sesso +"']"
#        #select "/qol/application/beans/vo/VoContraente.strCodStatoCivile", "label="+	$Stato_civile
#        select "idstatocivile", "label=Sposato/a"
#      select "/qol/application/beans/vo/VoContraente.strCodProfessione", "label="+	$Professione
#        type "CAP", 																	$Cap
#        select "/qol/application/beans/vo/VoContraente.strAnniPatente", "label="+		$N_anni_patente
#        click 																		$Intestatario_conducente
#        click 																		$Intestatario_proprietario
#        click "SUBMIT"
#        @selenium.wait_for_page_to_load $wait_for_page_to_load
#
#      sleep 3
#      select "numConducentiU26Dich", "label="+									$N_conducenti_inf_26
#        click "AutoAssicurateAllstate"
#        click "//input[@name='AutoAssicurateAllstate' and @value='"+				$Altri_conducenti_assicurati+ "']"
#        click "SUBMIT"
#        @selenium.wait_for_page_to_load $wait_for_page_to_load
#
#      if $Polizza_nuova_auto_nuova
#        #click "//input[@name='Assic5a' and @value='"+								$Flag_non_assicurato_5_anni+"']"
#        type "annoprimaimmatricolazione", 											$Data_imm_classe_14_mese + "/" + $Data_decorrenza_anno
#        #type "dataacquistoauto", 													$Data_decorrenza_anno
#      else
#        if $Polizza_nuova_auto_usata
#          type "annoprimaimmatricolazione", 											$Data_immatricolazione
#          type "dataacquistoauto", 													$Data_decorrenza_anno
#          click "//input[@name='/qol/application/beans/vo/VoBMAgevolata.intProvenienza' and @value='0']"  #no bersani
#        else
#          select "classeProvenienzaAuto","label="+									$Classe_BM_provenienza
#          select "classeAssegnazioneAuto","label="+									$Classe_BM_assegnazione
#          click "//input[@name='Assic5a' and @value='"+								$Flag_assicurato_5_anni+"']"
#          type "annoprimaimmatricolazione", 											$Data_immatricolazione
#          type "dataacquistoauto", 													$Data_acquisto_auto_anno
#          click "//input[@name='Sinistri5a' and @value='"+							$Flag_sinistri_5_anni+"']"
#        end
#
#      end
#
#        click "select_marca"
#        select "select_marca", "label="+											$Marca_auto
#      @selenium.fire_event "select_marca", "blur"
#      select "select_modelli", "label="+											$Modello_auto
#        sleep 2
#        click "PROSEGUI"
#      @selenium.wait_for_page_to_load $wait_for_page_to_load
#
#        select "allestimentoAuto", "label="+										$Allestimento_auto
#        select "UsoPra", "label="+ 													$Uso_auto
#        type "KMPercorsi", 															$N_km
#        click "PROSEGUI"
#      @selenium.wait_for_page_to_load $wait_for_page_to_load
#
#      select "iCodRicoveroNotturno", "label="+ 									$Ricovero_notturno
#      select "iCodAntifurto", "label="+											$Antifurto
#        #click "/qol/application/beans/vo/VoAuto.vectorOptional[2].strFlagSelezionato"
#        click "SUBMIT"
#      @selenium.wait_for_page_to_load $wait_for_page_to_load
#
#      click "AVANTI"
#      @selenium.wait_for_page_to_load $wait_for_page_to_load
#
#
#      click_coperture $No_bonus_protetto
#      click_coperture	$No_incendio_furto
#      click_coperture	$No_infortuni_conducente
#      click_coperture	$No_assistenza
#      click_coperture	$No_tutela_legale
#      click "RICALCOLA"
#      @selenium.wait_for_page_to_load $wait_for_page_to_load
#      select_massimale("SelM_RCA", "RICALCOLA")
#
#      #premio = @selenium.get_text "premioRCADiv"
#      premio = @selenium.get_text("//div[@id='premioTotaleAnnuoEuroDiv']/font")	#questo premio include lo sconto !!!
#      premio = premio[3..premio.length()]
#      premio = premio.gsub(".","") if premio
#      premio = premio.gsub(",",".") if premio
#      @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
#      raise RangeError, "Price cannot be nil" unless premio
#
#      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0
#
#      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
#      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
#      @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
#    rescue Timeout::Error => ex
#      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
#      @@logger.error('DirectLineTest.test_new => ' + $compagnia) {ex_message}
#      $writer.result_update("KO", ex_message)
#      raise ex.class, ex_message
#    rescue Exception => ex
#      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
#      @@logger.error('DirectLineTest.test_new => ' + $compagnia) {ex_message}
#      $writer.result_update("KO", ex_message)
#      raise ex.class, ex_message
#    end
#	end
#
#	def select(element, label)
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"      ...la label = "+label}
#	  wait_for_select(element, label)
#	  @selenium.select element, label
#	end
#
#	def click(element)
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
#	  wait_for_elm(element)
#	  @selenium.click element
#	end
#
#	def type(element, label)
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"      ...la label = "+label}
#	  wait_for_elm(element)
#	  @selenium.type element, label
#	end
#
#  def wait_for_select(nome_elemento_combo, label)
#    @last_element = nome_elemento_combo
#  	sleep $sleep
#  	if(nome_elemento_combo==nil)
#  		@@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
#  	end
#	if(label==nil)
#  		@@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
#  	end
#	label= label.gsub!("label=","")
#	if(label==nil)
#		@@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
#	end
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Label = "+label}
#
#	  @selenium.wait_for_element nome_elemento_combo
#	  var = @selenium.element? nome_elemento_combo
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
#	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }
#  end
#
#  def wait_for_elm(nome_elemento)
#    @last_element = nome_elemento
#	  sleep $sleep
#	  if(nome_elemento==nil)
#		  @@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
#	  end
#	  @selenium.wait_for_element nome_elemento
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
#	  var = @selenium.element? nome_elemento
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
#  end
#
#  def select_massimale(combo, recalculate)
#	  @selenium.wait_for_element combo
#	  lab = @selenium.get_selected_label combo
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
#	  if (lab != $Massimale_RCA)
#		  select combo, "label="+ $Massimale_RCA
#		  click recalculate
#		  @selenium.wait_for_page_to_load $wait_for_page_to_load
#	  end
#  end
#
#  def click_coperture(nome_elemento)
#    @last_element = nome_elemento
#    sleep $sleep
#    @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Click su elemento = "+ nome_elemento}
#    if(nome_elemento==nil)
#      @@logger.error('DirectLineTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
#    end
#      var = @selenium.element? nome_elemento
#      if var
#        checked = @selenium.get_value nome_elemento
#        if checked.to_s() == "on"
#            click nome_elemento
#        end
#      else
#      end
#  end
#
#  def const_publisher
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Professione  	 				=	" +	$Professione}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$N_anni_patente  	 			=	" +	$N_anni_patente}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_nascita	 				=	" +	$Data_nascita}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_nascita_giorno				=	" +	$Data_nascita_giorno}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_nascita_mese	 			=	" +	$Data_nascita_mese}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_nascita_anno	 			=	" +	$Data_nascita_anno}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Sesso	 						=	" +	$Sesso}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Stato_civile 	 				=	" +	$Stato_civile}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Cap	 							=	" +	$Cap}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Classe_BM_provenienza  			=	" +	$Classe_BM_provenienza}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Classe_BM_assegnazione  		=	" +	$Classe_BM_assegnazione}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Flag_sinistri_5_anni  			=	" +	$Flag_sinistri_5_anni}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Marca_auto  	 				=	" +	$Marca_auto}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Modello_auto  	 				=	" +	$Modello_auto}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Allestimento_auto  	 			=	" +	$Allestimento_auto}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_immatricolazione			=	" +	$Data_immatricolazione}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_immatricolazione_anno   	=	" +	$Data_immatricolazione_anno}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_immatricolazione_mese   	=	" +	$Data_immatricolazione_mese}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"$Data_immatricolazione_giorno 	=	" +	$Data_immatricolazione_giorno}
#	  @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
#    @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Data_decorrenza_giorno = "+ 		$Data_decorrenza_giorno}
#		@@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Data_decorrenza_mese = "+ 			$Data_decorrenza_mese}
#    @@logger.debug('DirectLineTest.test_new => ' + $compagnia) {"Data_decorrenza_anno = "+ 			$Data_decorrenza_anno}
#  end
#end
