#############################################
#   	Created by Kubepartners			          #
#                                           #
#				17/03/2010						              #
#############################################

class DialogoSect1 < Test::Unit::TestCase
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
#      page_3
#      page_4

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

    open_page(@url) #url="http://www.dialogo.it/DialogoInternet/home.faces"

    click_button "//img[@alt='Preventivo Auto in 5 click']"
    page_wait
    
  end

  def page_2

    @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => CURRENT PAGE TITLE: #{page.get_title.upcase}"}
#      page_click "contentSubView:contentForm:knowledgeSelect"
    select_option "contentSubView:contentForm:knowledgeSelect", get("@how_do_you_know_the_company")

    click_option(get('@vehicle_use'))
    click_option(get('@insurance_situation'))
    type_text("contentSubView:contentForm:decorrenza", @rate_date)
  end

  def page_3
    
    case page.get_text("//label[@for='#{@last_element}']") =~ /fisica/i
      when Individual
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlProvince", get('@residence_province'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlMunicipality", get('@residence'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlCountry", get('@citizenship'))
        click_option(get('@owner_sex'))
        type_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_txtBirthDate", get('@birth_date'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlJob", get('@job'))
      else
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlProvince", get('@residence_province'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlMunicipality", get('@residence'))
    end
      if $Polizza_nuova_auto_nuova
        click "//input[@name='contentSubView:contentForm:attualeSituazione' and @value='1']"
        type "contentSubView:contentForm:decorrenza", 								$Data_decorrenza
        click "//input[@name='contentSubView:contentForm:bonusMalusRadio' and @value='N']"		#no bersani
      else
        if $Polizza_nuova_auto_usata
          click "//input[@name='contentSubView:contentForm:attualeSituazione' and @value='2']"
          type "contentSubView:contentForm:decorrenza", 							$Data_decorrenza
          click "//input[@name='contentSubView:contentForm:bonusMalusRadio' and @value='N']"		#no bersani
        else
          click 																	$Situazione_assicurativa_BM
          type "contentSubView:contentForm:decorrenza", 							$Data_decorrenza
          select "contentSubView:contentForm:classeAssegnazioneCu", "label="+ 	$Classe_BM
          select "contentSubView:contentForm:sinistriCausati4", "label="+			$N_sinistri_4_anni
        end
      end

        click "contentSubView:contentForm:buttonNext"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      click  																			$Conducenti_Dialogo
        click 																			$Intestatario_Driver_Dialogo
      click 																			$Intestatario_Proprietario_Dialogo
      click 																			$Cointestazione_Dialogo
      click "//input[@name='contentSubView:contentForm:MFRProprietario' and @value='"+ $Sesso + "']"
      click																			$Proprietario_is_conducente
        type "contentSubView:contentForm:DataNascitaProprietario", 						$Data_nascita
        select "contentSubView:contentForm:AnniPatenteProprietario", "label="+			$N_anni_patente
        select "contentSubView:contentForm:ProfessioneProprietario", "label="+			$Professione
        select "contentSubView:contentForm:NazionalitaProprietario", "label="+			$Nazionalita
    #    type "contentSubView:contentForm:ZipCodeProprietario", 						$Cap_new


    #    click "contentSubView:contentForm:buttonNext"
    #    @selenium.wait_for_page_to_load $wait_for_page_to_load
    #
    #	if $Cap == "22063"
    #		sleep 5
    #	end
        type "contentSubView:contentForm:ZipCodeProprietario", 							$Cap
      @selenium.key_up "contentSubView:contentForm:ZipCodeProprietario", "\13"
    #	sleep 3
    #	click "contentSubView:contentForm:backPD"
    #	sleep 3
    #    click "contentSubView:contentForm:buttonNext"
    #    @selenium.wait_for_page_to_load $wait_for_page_to_load
      sleep 3
        click "contentSubView:contentForm:buttonNext"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      if $Polizza_nuova_auto_nuova
        type "contentSubView:vehicleForm:chooseAuto:registration", 							$Data_imm_classe_14_mese + "/" + $Data_decorrenza_anno
      else
        if $Polizza_nuova_auto_usata
          type "contentSubView:vehicleForm:chooseAuto:registration", 						$Data_immatricolazione_mese + "/" + $Data_immatricolazione_anno
        else
          type "contentSubView:vehicleForm:chooseAuto:registration", 						$Data_immatricolazione_mese + "/" + $Data_immatricolazione_anno
        end
      end

        select "contentSubView:vehicleForm:chooseAuto:brands", "label="+							$Marca_auto
      sleep 3
      select "contentSubView:vehicleForm:chooseAuto:models", "label="+							$Modello_auto
      sleep 3


      type "preparations", 																	$Allestimento_auto
        select "contentSubView:vehicleForm:chooseAuto:preparationsCombo", "label="+ 			$Allestimento_auto
        type "contentSubView:vehicleForm:chooseAuto:preparationsHidden", 						$Allestimento_auto

        type "contentSubView:vehicleForm:chooseAuto:kms", 											$N_km
        type "contentSubView:vehicleForm:chooseAuto:insurableValue", 								$Valore_auto
      click 																			$Ricovero_notturno
        click "contentSubView:vehicleForm:next"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      sleep 5
    #	click "contentSubView:detailForm:buttonNextImg_2"
    #	@selenium.wait_for_page_to_load $wait_for_page_to_load
      mywindow = "http://www.dialogo.it/DialogoInternet/pages/quote/quotationData.faces"
      @last_element = mywindow
      @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Open in a new browser window the page " + mywindow}
      @selenium.open_window mywindow, "myWindow"
#      @selenium.open_window "","myWindow"
      @selenium.select_window "myWindow"
#      @selenium.wait_for_page_to_load $wait_for_page_to_load

      sleep 3

    #	@selenium.wait_for_element "contentSubView:quotationTabletForm:proposalTable:0:platinumSelectBox"
    #	lab = @selenium.get_selected_label "contentSubView:quotationTabletForm:proposalTable:0:platinumSelectBox"
    #	@@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
    #	if (lab != $Massimale_RCA)
    #		select "contentSubView:quotationTabletForm:proposalTable:0:platinumSelectBox", "label="+ $Massimale_RCA
    #		click "buttonRecomputeImg"
    #		@selenium.wait_for_page_to_load $wait_for_page_to_load
    #	end

      wait_for_elm("contentSubView:quotationTabletForm:proposalTable:0:_id133")
      lab = @selenium.get_selected_label "contentSubView:quotationTabletForm:proposalTable:0:_id133"
      @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
      if (lab != $Massimale_RCA)
        select "contentSubView:quotationTabletForm:proposalTable:0:_id133", "label="+ $Massimale_RCA
        click "buttonRecomputeImg"
#        @selenium.wait_for_page_to_load $wait_for_page_to_load
        sleep 5
        wait_for_elm("//div[@id='sbox_Costo Annuale']/span")
      end


      uncheck "contentSubView:quotationTabletForm:proposalTable:1:_id147"
      uncheck "contentSubView:quotationTabletForm:proposalTable:2:_id147"
      uncheck "contentSubView:quotationTabletForm:proposalTable:3:_id147"
      uncheck "contentSubView:quotationTabletForm:proposalTable:7:_id147"

      click "buttonRecomputeImg"

      sleep 5
      wait_for_elm get("@rca_premium_id")
      get_premium(get("@rca_premium_id"))

      wait_for_elm("//div[@id='sbox_Costo Annuale']/span")
      str = premio.split
      premio = str[1]
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio
      @@logger.debug('DialogoTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
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
    assert_not_nil label.gsub!("label=","")
#    raise RangeError, "Wait for select failed! Element cannot be nil" unless combo_name
#    raise RangeError, "Wait for select failed! Label cannot be nil" unless label
#    raise RangeError, "Wait for select failed! Label cannot be nil" unless label.gsub!("label=","")
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
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano1", get('@nr_of_paid_claims_1_yr'))
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano2", get('@nr_of_paid_claims_2_yr'))
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano3", get('@nr_of_paid_claims_3_yr'))
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano4", get('@nr_of_paid_claims_4_yr'))
    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano5", get('@nr_of_paid_claims_5_yr'))
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
	  assert page.element?(element) == true, "Wait for element failed! Element not present = #{element}"
  end
  
end

