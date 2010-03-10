#############################################
#   	Created by Kubepartners			          #
#                                           #
#				01/03/2010						              #
#############################################

#gem "selenium-client", ">=1.2.13"
#require "selenium/client"

class QuixaSect1 < Test::Unit::TestCase
  attr_reader :selenium_driver, :browser
  alias :site :browser
  alias :page :selenium_driver

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
      @browser = RunBrowser.new
      @browser.selenium_setup
      @kte = @browser.kte
      @logger = @kte.logger

      site.person
      site.sector
      puts get("@owner_specification")
      
      @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => Setting up Selenium Page ..."}
#      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("Compagnia QUIXA \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

      @rc_cover_code, @kte.rc_cover_code = get('@rca_code'), get('@rca_code')
      @record = get('@record_id')
      @rate_date = format_date(@kte.rate_date)

      vehicle_age = 1
      @matriculation_date = Chronic.parse("#{vehicle_age} years before today")

      @url = eval(site.url)
      @sleep = @kte.sleep_typing
      @verification_errors = []
      #      const_publisher

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
    assert_equal [], @verification_errors
  end
  
  def test_site

    begin
      @last_element, @last_value = nil, nil
      @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{page.get_title}"}

      page_1
      page_2
#      page_3
      @kte.rc_premium = 1000
      @kte.test_result = "Test OK => New RCA price for profile [#{@kte.profile}] and record [#{@record}]: € #{@kte.rc_premium}"
      @logger.info("#{__FILE__} => #{method_name}") {"#{@kte.company} => [#{@kte.test_result}]"}

      #@selenium.set_speed 2000
    rescue Timeout::Error => ex
      ex_message = "#{ex.class.to_s}: Selenium Timeout for profile [#{@kte.profile}] and record [#{@record}] on element -> [#{@last_element}]: #{ex.message.to_s}"
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex_message}"}
      @kte.test_result = ex_message
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = "#{ex.class.to_s}: Selenium error for profile [#{@kte.profile}] and record [#{@record}] on element -> [#{@last_element}]: #{ex.message.to_s}"
      @logger.error("#{__FILE__} => #{method_name}") {"#{@kte.company} => #{ex_message}"}
      @kte.test_result = ex_message
      raise ex.class, ex_message
    end
  end

  def page_1

    open_page(@url) #"/simulator.aspx?SimObject=CAR"

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlBrand", get('@make'))

    type_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_txt1stPlate", get('@matriculation_date'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlModel", get('@model'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVersion", get('@set_up'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVersion", get('@set_up'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlFuelType", get('@fuel'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlKmPerYear", get('@km_per_yr'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVehicleUse", get('@habitual_vehicle_use'))

    click_option(get('@alarm'))

    click_button("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward")

  end

  def page_2

#      wait_for_alert()

    click_option(get('@leasing'))

    click_option(get('@client_type'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlProvince", get('@residence_province'))

#    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlMunicipality", get('@residence'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlCountry", get('@citizenship'))

    click_option(get('@driver_sex'))

    type_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_txtBirthDate", get('@birth_date'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlJob", get('@job'))

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlInsuranceSituation", get('@insurance_situation'))
    case /(attestato)*/.match(page.get_selected_label("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlInsuranceSituation"))
      when true
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlSelectBersani", get('@bersani'))
      else
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano1", get('@nr_of_paid_claims_1_yr'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano2", get('@nr_of_paid_claims_2_yr'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano3", get('@nr_of_paid_claims_3_yr'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano4", get('@nr_of_paid_claims_4_yr'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano5", get('@nr_of_paid_claims_5_yr'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano0", get('@nr_of_paid_claims_this_yr'))
        select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlCongenere", get('@coming_from_company'))
    end

    type_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_txtDateEffect", @rate_date)

    select_option("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlClassBonus", get('@bm_assigned'))

    click_option(get('@driver_less_than_26_yrs'))

    click_button("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward")

  end

  def page_3

    if $Polizza_nuova_auto_nuova
      page_click "//option[@value='2']"
    else
      if $Polizza_nuova_auto_usata
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlInsuranceSituation", "label="+ "Prima Polizza dopo l'acquisto di un veicolo"
      else
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlInsuranceSituation", "label="+ $Situaziona_assicurativa
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlClassBonus", "label="+			$Classe_BM
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano1", "label="+					$N_incidenti_anno_1
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano2", "label="+					$N_incidenti_anno_2
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano3", "label="+					$N_incidenti_anno_3
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano4", "label="+					$N_incidenti_anno_4
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano5", "label="+					$N_incidenti_anno_5
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlano0", "label="+					$N_incidenti_anno_0
        page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlCongenere", "label="+			$Compagnia_precedente
      end
    end
    page_click 																															$Flag_no_leasing
    page_type "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_txtDateEffect", 						$Data_decorrenza
    page_click 																															$Flag_conducenti_inf_26
    page_click "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward"
    #sleep 3 #non commentare in Quixa

    page_click "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward"
  #sleep 3 #non commentare in Quixa

#      $Massimale_RCA = $Massimale_RCA + " €"
#      page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddl_P01_Max", "label="+ 			$Massimale_RCA
    page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddl_P01_Max", "label=" + $Massimale_RCA

    page_select "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddlChargeType", "label="+ 		$Mezzo_pagamento
    page_click "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnReCalculation"
    sleep 3

    wait_for_elm "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_lblVisible_DA_Prize"
    assert !60.times{ break if (page.get_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_lblVisible_DA_Prize").split[0].to_s.match(/[a-zA-Z]/) == nil rescue false); sleep 1 }
    premio = page.get_text("ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_lblVisible_DA_Prize")
    raise RangeError, "Price cannot be a string" if premio.split[0].to_s.match(/[a-zA-Z]/) == nil ? false : true
    premio = premio.split[0]
    premio = premio.gsub(".","") if premio
    premio = premio.gsub(",",".") if premio

    @logger.debug('QuixaTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
    raise RangeError, "Price cannot be nil" unless premio
    raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

#    $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
#    $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, @rate, premio)
    @logger.debug('QuixaTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
  end
	
	def page_click(element)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Click on element = #{element}"}
#	  wait_for_elm(element)
	  page.click element
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

	def page_type(element, label)
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Type on element = #{element} a string = #{label}"}
	  wait_for_elm(element)
	  page.type element, label
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

#	def page_select_regex(element, label)
#	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => Select from combo = #{element} a label using regex expression = #{label}"}
#	  wait_for_select(element, label, "regex")
#	  page.select element, label
#	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element value = #{page.get_selected_value(element)}"}
#	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => visible element text = #{page.get_selected_label(element)}"}
#	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => all element options = #{page.get_select_options(element)}"}
#	end

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
    raise RangeError, "Wait for select failed! Element cannot be nil" unless combo_name
    raise RangeError, "Wait for select failed! Label cannot be nil" unless label
    raise RangeError, "Wait for select failed! Label cannot be nil" unless label.gsub!("label=","")
	  wait_for_elm combo_name
	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => combo is present: #{page.element? combo_name}"}
	  assert !60.times{ break if (page.get_select_options(combo_name).include?(label)); sleep 1 }	unless /(regexpi)*/.match(label)
  end
  
  def wait_for_elm(name)
  	sleep @sleep
	  page.wait_for_element name
		assert !30.times{ break if (! page.is_visible("ctl00_UpdateProgress1")); sleep 1; @logger.debug("#{__FILE__} => #{method_name}") \
                               {"#{@kte.company} => Waiting combo "+ name;} } \
                                if page.is_visible("ctl00_UpdateProgress1") \
                                if page.element? "ctl00_UpdateProgress1"
	  raise RangeError, "Wait for element failed! Element not present = #{name}" unless page.element? name
#	  @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => element name = #{name}"}
      
  end  
  
	def wait_for_alert()
		!8.times{ break if (page.alert?); sleep 1; puts "Waiting alert ..."; }
		page.alert() if page.alert?
	end     
	
	def log_vars
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Comune_residenza	 =	" +		$Comune_residenza}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Marca_auto  	 =	" +		$Marca_auto}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Modello_auto  	 =	" +		$Modello_auto}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Allestimento_auto  	 =	" +		$Allestimento_auto}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Provincia  	 =	" +		$Provincia}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Professione  	 =	" +		$Professione}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Classe_BM  	 =	" +		$Classe_BM}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Sesso	 =	" +		$Sesso}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_nascita_giorno	 =	" +		$Data_nascita_giorno}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_nascita_mese	 =	" +		$Data_nascita_mese}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_nascita_anno	 =	" +		$Data_nascita_anno}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_nascita	 =	" +		$Data_nascita}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_immatricolazione_mese	 =	" +		$Data_immatricolazione_mese}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_immatricolazione_anno	 =	" +		$Data_immatricolazione_anno}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Data_immatricolazione	 =	" +		$Data_immatricolazione}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_1  	 =	" +		$N_incidenti_anno_1}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_2  	 =	" +		$N_incidenti_anno_2}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_3  	 =	" +		$N_incidenti_anno_3}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_4  	 =	" +		$N_incidenti_anno_4}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_5  	 =	" +		$N_incidenti_anno_5}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$N_incidenti_anno_0  	 =	" +		$N_incidenti_anno_0}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"$Massimale_RCA  	 =	" +		$Massimale_RCA}
    @logger.debug('QuixaTest.test_new => ' + $compagnia) {"Data_decorrenza_giorno = "+ 		$Data_decorrenza_giorno}
		@logger.debug('QuixaTest.test_new => ' + $compagnia) {"Data_decorrenza_mese = "+ 			$Data_decorrenza_mese}
    @logger.debug('QuixaTest.test_new => ' + $compagnia) {"Data_decorrenza_anno = "+ 			$Data_decorrenza_anno}
	end

  def open_page(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's opened page element: [#{@last_element}]"}
    page.open @last_element
    sleep @sleep
  end

  def select_option(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's selected option element: [#{@last_element}] with label value: [#{@last_value}]"}
    page_select @last_element, "label=#{@last_value}"
  end

  def type_text(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's typed text element: [#{@last_element}] with string value: [#{@last_value}]"}
    page_type @last_element, "#{@last_value}"
  end

  def click_option(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's checked option button element: [#{@last_element}]"}
    page_click @last_element
  end

  def click_checkbox(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's checked checkbox element: [#{@last_element}]"}
    page_click @last_element
  end

  def click_button(id, value = nil)
    @last_element, @last_value = id, value
    @logger.debug("#{__FILE__} => #{method_name}") {"#{@kte.company} => now's clicked button element: [#{@last_element}]"}
    page_click @last_element
  	sleep @sleep*2
  end

  def page_wait
   page.wait_for_page_to_load site.wait_for_page_to_load
  end

end
