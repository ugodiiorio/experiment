#############################################
#   	Created by Kubepartners			          #
#                                           #
#				26/03/2010						              #
#############################################

class ConteSect1 < Test::Unit::TestCase
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

  def page_intro

    open_page(@url)
#    click_button '//img[@alt="Clicca qui per  il tuo preventivo Auto"]'
   	page_wait

  end

  def page_1

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}

    select_option "page:text_1CNSC", get("@how_do_you_know_the_company")
    click_option(get('@insurance_situation'))
    if (page.get_attribute("#{@last_element}@value") == "-1")
      click_option(get('@new_used_vehicle'))
    end
    click_option(get('@privacy_1'))

    click_button 'page:buttonContinua'
   	page_wait
    
  end

  def page_2

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}

    type_text("page:dataEffetto", @rate_date)
    select_option "page:mese_immatricolazione", get("@matriculation_date_month")
    type_text("page:anno_immatricolazione", get("@matriculation_date_year"))
    type_text("page:anno_acquisto", get("@purchase_date_year"))
    select_option "page:alimentazione", get("@fuel")
    select_option "page:marca", get("@make")
    sleep @sleep*2
    select_option "page:modelloAuto", get("@model")
    sleep @sleep*2
    select_option "page:allestimento", get("@set_up")

    click_button 'page:continua_step01'

    type_text("page:valore_veicolo", get('@vehicle_value'))
    page.fire_event 'page:valore_veicolo', 'blur'
    select_option "page:ricovero_notturno", get("@vehicle_shelter")
    select_option "page:antifurto", get("@alarm")
    select_option "page:uso_prevalente", get("@habitual_vehicle_use")
    select_option "page:km_anno", get("@km_per_yr")
    click_option(get('@modification_made'))
    click_option(get('@bersani'))
    select_option "page:classeCU", get("@bm_assigned")
    click_option(get('@subscriber_is_owner'))
    click_option(get('@subscriber_is_driver'))

    click_button 'page:buttonContinua'
   	page_wait
    
  end

  def page_3

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}

    click_option(get('@driver_sex'))
    type_text("page:conducente_nascita", get('@birth_date'))
    click_option(get('@citizenship'))
    select_option "page:provincia_di_nascita", get("@birth_province")
    page.click "page:comune_di_nascita"
    type_text("page:comune_di_nascita", get('@birth_place'))
#    sleep @sleep*1
    page.click "page:comune_di_nascita"
    page.click "//div[@id='risultatiSrchComNas']/ul/span/li"

#    page.fire_event 'page:comune_di_nascita', 'focus'
#    page.key_press("page:comune_di_nascita","\\9" )
#    page.key_up "page:comune_di_nascita", "\\115"

#      #click "//li[@onclick='SrchComNas.setResult(" + 				$Codice_comune + ");']"
#      click "//li[@onclick='srchComNasIst.setResult(" + 				$Codice_comune + ");']"
#      @selenium.fire_event "page:comune_di_nascita", "blur"
#      #sleep 1
#      click "page:buttonContinua"
#
#    page.fire_event 'page:comune_di_nascita', 'focus'
#    sleep @sleep*2
#    page.key_press("page:comune_di_nascita","\\13" )

#    page.fire_event 'page:comune_di_nascita', 'blur'
#    page.click '//html/body/center/table/tbody/tr[4]/td/table[2]/tbody/tr/td/form/table/tbody/tr/td/table/tbody/tr[2]/td/table/tbody/tr[8]/td/table/tbody/tr[3]/td/table/tbody/tr/td[2]/table/tbody/tr[2]/td/div/ul/span/li'

    click_button 'page:buttonContinua'

    select_option "page:provincia_di_residenza", get("@residence_province")
    page.click "page:comune_di_residenza"
    type_text("page:comune_di_residenza", get('@residence'))
    page.click "page:comune_di_residenza"
    page.click "//div[@id='risultatiSrchComRes']/ul/span/li"

    type_text("page:toponimo_residenza", get('@toponym'))
    type_text("page:indirizzo_residenza", get('@address_street'))
    type_text("page:numero_residenza", get('@address_num'))
    page.click 'page:cap_di_residenza'
    select_option "page:cap_di_residenza", get("@owner_zip_code")

    click_button 'page:buttonContinua2'

    type_text("page:professione_conducente_principale", get('@job'))

    select_option "page:stato_civile", get("@civil_status")
    click_option(get('@cohabiting_children'))
    type_text("page:eta_conseguimento_patente", get('@driving_license_yrs'))
    select_option "page:tipo_patente", get("@driving_license_type")
    select_option "page:punti_patente", get("@driving_license_points")

    click_button 'page:buttonContinua3'
    page_wait

  end

  def page_4

    click_option(get('@drunkenness_fine'))
    click_option(get('@driving_license_suspension'))
    click_option(get('@other_vehicle_use'))

    click_button 'page:buttonContinua6'

    click_option(get('@claims_total_number'))
    if (page.get_attribute("#{@last_element}@value") == "1")
      select_option "page:numero_sinistri_cc", get("@nr_of_paid_claims_2_yr")
      select_option "page:MeseSinistroConColpa1", get("@first_claim_month")
      select_option "page:AnnoSinistroConColpa1", get("@first_claim_year")

      if page.get_selected_label(@last_element) == '2'
        select_option "page:MeseSinistroConColpa2", get("@second_claim_month")
        select_option "page:AnnoSinistroConColpa2", get("@second_claim_year")
      end

    end

    click_button 'page:buttonContinua14'

    type_text("page:cognome_contraente", get('@name'))
    type_text("page:nome_contraente", get('@surname'))
    type_text("page:email_contraente", get('@e_mail'))
    type_text("page:prefisso_cellulare_contraente", get('@mobile_prefix'))
    type_text("page:cellulare_contraente", get('@mobile_number'))

    click_button 'page:buttonContinua3'
    page_wait

  end

  def page_5

    click_option(get('@driving_type'))
    click_option(get('@payment'))
    click_option('page:metodoDiPagamento2:0')
    

    click_button 'page:buttonCalcolaPremioAppoggio'
    page_wait


  end

  def page_premium

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
    @last_element, @last_value = "@rca_on_off", get("@rca_on_off")
    case @last_value
      when 'on'
        sleep @sleep*2
#        select_option("page:quota_info:0:tipoRCA", get('@public_liability_type'))
        select_option("page:quota_info:0:massimaleRCA", get('@public_liability_indemnity_limit'))
      # all guarantees appears to be unchecked and anyway we take simple RCA premium value

#        uncheck_checkbox(get('@assistance_web_id')) if is_checked?(get('@assistance_web_id'))
#        uncheck_checkbox(get('@legal_assistance_web_id')) if is_checked?(get('@legal_assistance_web_id'))
#        uncheck_checkbox(get('@driver_accident_coverage_web_id')) if is_checked?(get('@driver_accident_coverage_web_id'))
#        uncheck_checkbox(get('@contingency_protection_web_id')) if is_checked?(get('@contingency_protection_web_id'))
#        uncheck_checkbox(get('@glasses_web_id')) if is_checked?(get('@glasses_web_id'))
#        uncheck_checkbox(get('@kasko_web_id')) if is_checked?(get('@kasko_web_id'))
#        uncheck_checkbox(get('@natural_events_act_of_vandalism_web_id')) if is_checked?(get('@natural_events_act_of_vandalism_web_id'))
#        uncheck_checkbox(get('@theft_fire_coverage_web_id')) if is_checked?(get('@theft_fire_coverage_web_id'))
#
#        click_button "b_recalculate"
#        sleep @sleep*5
#
#        @last_element, @last_value = "@rca_premium_id", get("@rca_premium_id")
#        wait_for_elm @last_value

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
    assert premium != nil, @last_element.inspect
    assert premium.to_s.match(/[a-zA-Z]/) == nil, @last_element.inspect
    premium = premium.gsub(".","")
    premium = premium.gsub(",",".")

    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => PREMIUM = € #{premium.to_s}"}
    assert_not_equal 0, premium.to_i, "Price cannot be equal to zero"
    @kte.rc_premium = premium

  end

  def assert_is_element_present(element)
	  assert page.element?(element) == true, "Wait for element failed! Element not present = #{element}"
  end

end
































##############################################
##   	Created by Kubepartners			          #
##                                           #
##				13/03/2009						              #
##############################################
#
#gem "selenium-client", ">=1.2.13"
#require "selenium/client"
#
#class ConTeTest < Test::Unit::TestCase
#
#  def setup
#    begin
#      @@logger.info('ConTeTest.setup => ' + $compagnia) {"Setting up Selenium Test ..."}
#      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("Compagnia CONTE \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#
#      @garanzia = "1"
#      @verification_errors = []
#      const_publisher
#
#      @@logger.debug('ConTe.setup => ' + $compagnia) {"Selenium port: "+ $port}
#      @selenium= Selenium::Client::Driver.new \
#        :host => "localhost",
#        :port => $port,
#        #:browser => "*safari",
#      :browser => $browser,
#        :url => "http://www.conte.it",
#        :timeout_in_seconds => $time_out
#
#      @selenium.start_new_browser_session
#      @selenium.set_context("test_new")
#    rescue Errno::ECONNREFUSED => ex
#      @@logger.error('ConTe.setup => ' + $compagnia) {ex.class.to_s + " => Selenium not started: " + ex.message.to_s}
#      raise ex
#    rescue Exception => ex
#      #      @verification_errors[@verification_errors.size] = ex.message
#      @@logger.error('ConTe.setup => ' + $compagnia) {ex.class.to_s + " => " + ex.message.to_s}
#      raise ex
#    end
#  end
#
#  def teardown
#    @selenium.close_current_browser_session #unless $selenium
#    assert_equal [], @verification_errors
#    #	$Result_file.close
#  end
#
#  def test_new()
#
#    begin
#      @last_element = nil
#      @selenium.open "https://preventivo.conte.it/calculator/"
#      sleep 7
#
#      @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Contratto esistente = "+		$Contratto_esistente.to_s()}
#
#      select "page:text_1CNSC", "label=Passaparola"
#
#      if $Polizza_nuova_auto_nuova
#        @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto nuova = "+	$Polizza_nuova_auto_nuova.to_s()}
#        #per il momento non dovrebbe entrare mai qui dentro
#        @@logger.error('ConTeTest.test_new => ' + $compagnia) {" ...  ERRORE! POLIZZA NUOVA AUTO NUOVA"}
#
#        click "page:situazione_1:0"		#polizza nuova
#        click "page:situazione_2:0"    	#auto nuova
#      else
#        if $Polizza_nuova_auto_usata
#          click "page:situazione_1:0"		#polizza nuova
#          click "page:situazione_2:1"		#auto udata
#          @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto usata = "+	$Polizza_nuova_auto_usata.to_s()}
#        else
#          click "page:situazione_1:1"		#polizza continuata
#          @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto usata = false"}
#          @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto nuova = false"}
#        end
#      end
#      click "page:privacy_contr"
#      click "page:buttonContinua"
#
#      type "page:dataEffetto", $Data_decorrenza
#      if $Polizza_nuova_auto_nuova
#        select "page:mese_immatricolazione", "label="+ 			$Data_imm_classe_14_mese
#        type "page:anno_immatricolazione", 						$Data_decorrenza_anno
#        type "page:anno_acquisto", 								$Data_decorrenza_anno
#      else
#        if $Polizza_nuova_auto_usata
#          select "page:mese_immatricolazione", "label="+ 		$Data_immatricolazione_mese
#          type "page:anno_immatricolazione",  				$Data_immatricolazione_anno
#          type "page:anno_acquisto", 							$Data_decorrenza_anno
#        else
#          select "page:mese_immatricolazione", "label="+ 		$Data_immatricolazione_mese
#          type "page:anno_immatricolazione", 					$Data_immatricolazione_anno
#          type "page:anno_acquisto", 							$Data_acquisto_anno
#        end
#      end
#      select "page:alimentazione", "label="+ 						$Alimentazione
#      @selenium.fire_event "page:alimentazione", "onchange"
#
#      select "page:marca", "label="+     $Marca_auto
#
#      #      type "page:marca",  										$Marca_auto
#      #          @selenium.key_up "page:marca", "\\115"
#      #click "//li[@onclick='SrchMarca.setResult(" + 				$Codice_marca + ");']"
#      #         click "//li[@onclick='srchMarcaIst.setResult(" + 			$Codice_marca + ");']"
#      @selenium.fire_event "page:marca", "onchange"
#sleep 10
#select "page:modelloAuto", "label="+     $Modello_auto
##      	type "page:modelloAuto",  										$Modello_auto
##      	@selenium.key_up "page:modelloAuto", "\\115"
#      #	#click "//li[@onclick='SrchModello.setResult(" + 			$Codice_modello + ");']"
##      	click "//li[@onclick='srchModelloIst.setResult(" + 			$Codice_modello + ");']"
##      	@selenium.fire_event "page:modelloAuto", "blur"
#@selenium.fire_event "page:modelloAuto", "onchange"
#sleep 5
#      allestimenti = 												$Allestimento_auto.split()
#      allestimento = allestimenti[0].to_s() + " " + allestimenti[1].to_s()
##      type "page:allestimento", allestimento
#      select "page:allestimento", "label="+     $Allestimento_auto
##      type "page:allestimento", $Allestimento_auto
#      @selenium.key_up "page:allestimento", "\\115"
#      #click "//li[@onclick='SrchAllest.setResult(" + 				$Codice_allestimento + ");']"
##      click "//li[@onclick='srchAllestIst.setResult(" + 				$Codice_allestimento + ");']"
#      @selenium.fire_event "page:allestimento", "blur"
##@selenium.fire_event "page:allestimento", "onchange"
#      click "page:continua_step01"
#
#      type "page:valore_veicolo", 								$Valore_auto
#      select "page:ricovero_notturno", "label=" +					$Ricovero_notturno
#      select "page:antifurto", "label=" +	 						$Antifurto
#      select "page:uso_prevalente", "label=" +	 				$Uso_abituale_auto
#      select "page:km_anno", 	"label=" +							$N_km
#
#      if $Contratto_esistente
#        select "page:classeCU", "label=" +						$Classe_BM
#      end
#      click "page:contraente_proprietario:0"   	#Conducente is proprietario
#      click "page:conducente_principale:0"		#Conducente principale
#      click "page:buttonContinua"
#
#      click 														$Sesso
#      type "page:conducente_nascita", 							$Data_nascita
#      select "page:provincia_di_nascita", "label=" + 				$Provincia_residenza
#      @selenium.fire_event "page:provincia_di_nascita", "onchange"
#      type "page:comune_di_nascita", 								$Comune_residenza
#      @selenium.key_up "page:comune_di_nascita", "\\115"
#      #click "//li[@onclick='SrchComNas.setResult(" + 				$Codice_comune + ");']"
#      click "//li[@onclick='srchComNasIst.setResult(" + 				$Codice_comune + ");']"
#      @selenium.fire_event "page:comune_di_nascita", "blur"
#      #sleep 1
#      click "page:buttonContinua"
#
#      select "page:provincia_di_residenza", "label=" + 			$Provincia_residenza
#      @selenium.fire_event "page:provincia_di_residenza", "onchange"
#
#
#      # COMUNE
#      type "page:comune_di_residenza", 							$Comune_residenza
#      sleep 2
#      click "page:comune_di_residenza"
#      sleep 2
#      click "//li[@onclick='srchComResIst.setResult(" + 				$Codice_comune + ");']"
#      sleep 2
#      #@selenium.key_up "page:comune_di_residenza", "\\115"
#      sleep 2
#      @selenium.fire_event "page:comune_di_residenza", "blur"
#      sleep 2
#
#      #ORIGINALE:
#      type "page:comune_di_residenza", 							$Comune_residenza
#      #	@selenium.key_up "page:comune_di_residenza", "\\115"
#      #	#click "//li[@onclick='SrchComRes.setResult(" + 				$Codice_comune + ");']"
#      #	click "//li[@onclick='srchComResIst.setResult(" + 				$Codice_comune + ");']"
#      #	@selenium.fire_event "page:comune_di_residenza", "blur"
#      #	#sleep 1
#
#      type "page:toponimo_residenza", 							$Toponimo
#      @selenium.key_up "page:toponimo_residenza", "\\115"
#      #click "//li[@onclick='SrchToponimi.vals.flagAltri=0;SrchToponimi.setResult(9);']"   #Codice via
#      click "//li[@onclick='srchToponimiIst.flagAltri=0;srchToponimiIst.setResult(9);']"
#      @selenium.fire_event "page:toponimo_residenza", "blur"
#      #sleep 1
#      type "page:indirizzo_residenza", 							$Indirizzo_via
#      type "page:numero_residenza", 								$Indirizzo_num
#      select "page:cap_di_residenza",  "label=" + 				$Cap
##      click "page:buttonContinua3"
#      click "page:buttonContinua2"
#
#      type "page:professione_conducente_principale", 				$Professione
#      @selenium.fire_event "page:professione_conducente_principale", "blur"
#      @selenium.key_up "page:professione_conducente_principale", "\\115"
#      #click "//li[@onclick='SrchProf.setResult(357);']"   #Codice "Impiegato Azienda"
#      click "//li[@onclick='srchProfIst.setResult(357);']"   #Codice "Impiegato Azienda"
#      select "page:stato_civile", "label=" + 						$Stato_civile
#      click "page:figli_minori:1"   #No figli minori di 17 anni
#      type "page:eta_conseguimento_patente", 						$Anni_patente
#      #select "page:tipo_patente", "label=Patente Italiana B"
#      select "page:tipo_patente", "label=B (auto)"
#      select "page:punti_patente", "label=" + 					$Punti_patente_ConTe
#      click "page:buttonContinua3"
#
#
#      click "page:multe_ebrezza_contraente:1"  #no multe in stato di ebbrezza
#      click "page:sospensione_patente_contraente:1"   # no sospensione patente
#      click "page:altro_veicolo:1"   # no utilizzo altro veicolo
#
#      if $Contratto_esistente
#        click "page:buttonContinua6"
#      else
#        click "page:buttonContinua198"
#      end
#
#      if $Contratto_esistente
#        click "page:sinistri_cc:1"   # no sinistri con colpa negli ultimi 3 anni
#        click "page:sinistri_sc:1"   # no sinistri senza colpa negli ultimi 3 anni
#        click "page:buttonContinua14"
#      end
#
#      type "page:cognome_contraente", 							$Cognome
#      type "page:nome_contraente", 								$Nome
#      type "page:email_contraente", 								$e_mail
#      type "page:prefisso_cellulare_contraente", 					$Mobile_prefisso
#      type "page:cellulare_contraente", 							$Mobile_suffisso
#      click "page:buttonContinua3"
#
#      click "page:radioGuidatori:1"  # guidatori tutti maggiori di 18 anni
#      @selenium.fire_event "page:radioGuidatori:1", "change"
#      click "page:buttonCalcolaPremio"
#
#      #	premio_loc = "page:quota_info:0:j_id186"
#      premio_loc = "page:quota_info:0:colonna_Premi"
#      #	premio_loc = "page:quota_info:0:j_id217"
#      wait_for_elm(premio_loc)
#      #	premio0 = @selenium.get_text("id=page:quota_info:0:j_id202")
#      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Premio0  = "+premio0}
#      #	click_coperture "page:quota_info:1:garanziaChecked"   # no incendio e furto
#      #	click_coperture "page:quota_info:8:garanziaChecked"   #no assistenza stradale
#      #	click_coperture "page:quota_info:9:garanziaChecked"   # no tutela legale
#      select "page:quota_info:0:massimaleRCA", "label="+ 			$Massimale_RCA
#      if @selenium.is_element_present("page:ricalcola_but")
#        click "page:ricalcola_but"
#        sleep 25
#        wait_for_elm(premio_loc)
#        sleep 10
#      end
#
#      premio = @selenium.get_text(premio_loc)
#
#      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"premio" + premio}
#      #	premio2 = @selenium.get_text("page:quota_info:0:j_id204")
#      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"premio 2" + premio2}
#      #	premio = @selenium.get_text(premio_loc)
#      #	print "Premio  = "+premio
#      #	html = @selenium.get_html_source()
#      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {html}
#      #	sleep 40
#      #	premio = @selenium.get_text(xpath="//table")
#      #	premio = @selenium.get_text(xpath="//table[@width='1024']/tbody/tr/td[@class='table_box']")
#      #	premio = @selenium.get_text(xpath="//table[@width='1010']/tbody/tr/td[@class='table_box']")
#      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Premio  = "+premio}
#      #	#premio2 = @selenium.get_text("xpath=//table[@id='page:premio']/tbody/tr/td/table[@border='0']/tbody/tr/td[@class='bg_premio_quota']/span[@class='td_label']")
#      #	premio2 = @selenium.get_text(xpath="//td[@id='page:quota_info:0:j_id202']")
#      #	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Premio2  = "+premio2}
#      # 	#premio = @selenium.get_value("bg_premio_quota")
#
#      raise RangeError, "Price cannot be nil" unless premio
#      @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
#      str = premio.split
#      premio = str[1].gsub(".","") if str[1].count(",") > 0
#      premio = premio.gsub(",",".")
#
#      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0
#
#      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
#      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
#      @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
#    rescue Timeout::Error => ex
#      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
#      @@logger.error('ConTeTest.test_new => ' + $compagnia) {ex_message}
#      $writer.result_update("KO", ex_message)
#      raise ex.class, ex_message
#    rescue Exception => ex
#      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
#      @@logger.error('ConTeTest.test_new => ' + $compagnia) {ex_message}
#      $writer.result_update("KO", ex_message)
#      raise ex.class, ex_message
#    end
#  end
#
#  def select(element, label)
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"      ...la label = "+label}
#    wait_for_select(element, label)
#    @selenium.select element, label
#  end
#
#  def click(element)
#  	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
#  	wait_for_elm(element)
#    @selenium.click element
#  end
#
#  def type(element, label)
#  	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
#  	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"      ...la label = "+label}
#  	wait_for_elm(element)
#    @selenium.type element, label
#  end
#
#  def wait_for_select(nome_elemento_combo, label)
#    @last_element = nome_elemento_combo
#  	sleep $sleep
#  	if(nome_elemento_combo==nil)
#  		@@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
#      raise RangeError, "Wait for select failed! Element cannot be nil"
#  	end
#    if(label==nil)
#  		@@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
#      raise RangeError, "Wait for select failed! Label cannot be nil"
#  	end
#    label= label.gsub!("label=","")
#    if(label==nil)
#      @@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
#      raise RangeError, "Wait for select failed! Label cannot be nil"
#    end
#	  @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
#	  @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Label = "+label}
#
#	  @selenium.wait_for_element nome_elemento_combo
#	  var = @selenium.element? nome_elemento_combo
#	  @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
#	  assert !60.times{ break if (@selenium.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }
#  end
#
#  def wait_for_elm(nome_elemento)
#    @last_element = nome_elemento
#	  sleep $sleep
#	  if(nome_elemento==nil)
#		  @@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
#      raise RangeError, "Wait for element failed! Element cannot be nil"
#	  end
#	  @selenium.wait_for_element nome_elemento
#	  @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
#
#	  var = @selenium.element? nome_elemento
#	  if var
#      @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
#    else
#  	  @@logger.error('ConTeTest.test_new => ' + $compagnia) {"Elemento = "+nome_elemento +" non presente"}
#      raise RangeError, "Wait for element failed! Element not present"
#    end
#  end
#
#  def click_coperture(nome_elemento)
#    @last_element = nome_elemento
#    sleep $sleep
#
#    if(nome_elemento==nil)
#      @@logger.error('ConTeTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
#    end
#    var = @selenium.element? nome_elemento
#    if var
#      if @selenium.is_checked nome_elemento
#        @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Click su elemento = "+ nome_elemento}
#        @selenium.uncheck nome_elemento
#        #@selenium.fire_event nome_elemento, "click"
#        sleep 2
#      end
#    else
#    end
#  end
#
#	def const_publisher()
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"sleep: "+ 						$sleep.to_s()}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"N_km = "+ 						$N_km}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_decorrenza = "+ 			$Data_decorrenza}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_acquisto_anno = "+ 		$Data_acquisto_anno}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Valore_auto = "+ 				$Valore_auto}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Tipo_patente = "+ 				$Tipo_patente}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Punti_patente_ConTe = "+ 		$Punti_patente_ConTe}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_decorrenza_giorno = "+ 		$Data_decorrenza_giorno}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_decorrenza_mese = "+ 			$Data_decorrenza_mese}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_decorrenza_anno = "+ 			$Data_decorrenza_anno}
#
#    # VARIABILI PROFILO
#    # --generiche
#  	@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_nascita_giorno = "+ 		$Data_nascita_giorno}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_nascita_mese = "+ 			$Data_nascita_mese}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_nascita_anno = "+ 			$Data_nascita_anno}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Cap = "+ 						$Cap}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_immatricolazione_mese = "+ $Data_immatricolazione_mese}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Data_immatricolazione_anno = "+ $Data_immatricolazione_anno}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Anni_patente = "+ 				$Anni_patente}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Classe_BM = "+ 					$Classe_BM}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Sesso = "+ 						$Sesso}
#    # --specifiche compagnia
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Provincia_residenza = "+ 		$Provincia_residenza}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Alimentazione = "+ 				$Alimentazione}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Marca_auto = "+ 				$Marca_auto}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Allestimento_auto = "+ 			$Allestimento_auto}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Professione = "+ 				$Professione}
#    @@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Stato_civile = "+ 				$Stato_civile}
#
#
#		# VARIABILI ANAGRAFICA
#		# -- generiche
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Nome = "+ 						$Nome}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Indirizzo_via = "+ 				$Indirizzo_via}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Indirizzo_num = "+ 				$Indirizzo_num}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Mobile_prefisso = "+ 			$Mobile_prefisso}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Mobile_suffisso = "+ 			$Mobile_suffisso}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"e_mail = "+ 					$e_mail}
#		# -- specifiche compagnia
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Toponimo = "+ 			$Toponimo}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Comune residenza  = "+ 			$Comune_residenza}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Codice Comune  = "+ 			$Codice_comune}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"profilo " + 					$profilo_assicurativo}
#		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Massimale RCA " + 				$Massimale_RCA}
#
#    #		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Contratto esistente = "+		$Contratto_esistente.to_s()}
#    #		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto usata = "+	$Polizza_nuova_auto_usata.to_s()}
#    #		@@logger.debug('ConTeTest.test_new => ' + $compagnia) {"Polizza nuova auto nuova = "+	$Polizza_nuova_auto_nuova.to_s()}
#	end
#
#end
