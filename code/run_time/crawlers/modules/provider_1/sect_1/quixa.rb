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
      
      @logger.info(__FILE__ + ' => ' + method_name) {"#{@kte.company} => Setting up Selenium Page ..."}
#      $Result_file.puts("\n******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("Compagnia QUIXA \n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("Profilo n "+ $profilo_assicurativo.to_s()+"\n") unless $selenium_out_level == 0 || $Result_file == STDOUT
#      $Result_file.puts("******************************************************\n") unless $selenium_out_level == 0 || $Result_file == STDOUT

      @rate_date = format_date(@kte.rate_date)
      vehicle_age = 1
      @matriculation_date = Chronic.parse("#{vehicle_age} years before today")
      @rc_cover = get("@rca_code")
      @verification_errors = []
      @url = eval(site.url)
      @sleep = @kte.sleep_typing
      #      const_publisher

      @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => Selenium port: #{@kte.port}"}
      @selenium_driver = Selenium::Client::Driver.new \
        :host => site.host,
        :port => site.port,
        :timeout_in_seconds => site.timeout_in_secs,
        :browser => site.browser,
        :url => @url

      @selenium_driver.start_new_browser_session
#      @selenium.set_context("test_new")

    rescue Errno::ECONNREFUSED => ex
      @logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex.class.to_s} Selenium not started: #{ex.message.to_s}"} if @logger
      raise ex
    rescue Exception => ex
#      @verification_errors[@verification_errors.size] = ex.message
      @logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex.class.to_s}: #{ex.message.to_s}"} if @logger
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
      @logger.info(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{page.get_title}"}

      page_1
      page_2
#      page_3
      @kte.rca_premium = 1000
      @kte.test_result = "Test OK => New RCA price for profile #{@kte.profile} = #{@kte.rca_premium}"
      @logger.info(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{@kte.test_result}"}

      #@selenium.set_speed 2000
    rescue Timeout::Error => ex
      ex_message = "#{ex.class.to_s}: Selenium Timeout on element -> #{@last_element} - #{ex.message.to_s}"
      @logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex_message}"}
      @kte.test_result = ex_message
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = "#{ex.class.to_s}: Selenium error on element -> #{@last_element} - #{ex.message.to_s}"
      @logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex_message}"}
      @kte.test_result = ex_message
      raise ex.class, ex_message
    end
  end

  def page_1

    @last_element, @last_value = @url, nil #"/simulator.aspx?SimObject=CAR"
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running page element: #{@last_element}"}
    page.open @last_element
#      page_click "/html/body/form/div[3]/div/div[3]/div/div/map[4]/area"
#      page_click   "//div[@id='hidepage']/div[1]/div[3]/div[1]/div[1]/map[3]/area"  #causa promozione feltrinelli si è spostato il bottone "fai preventivo" promozione in scadenza 14&/12/2009
#      page_wait
    #sleep 3 #non commentare in Quixa
    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlBrand", get('@make')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with label value: #{@last_value}"}
    page_select_regex @last_element, "label=#{@last_value}"
    #sleep 2
#    if $Polizza_nuova_auto_nuova
    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_txt1stPlate", get('@matriculation_date')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running text element: #{@last_element} with string value: #{@last_value}"}
    page_type @last_element, "#{@last_value}"
#    else
#      if $Polizza_nuova_auto_usata
#        page_type "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_txt1stPlate", 						$Data_immatricolazione
#      else
#        page_type "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_txt1stPlate", 						$Data_immatricolazione
#      end
#    end

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlModel", get('@model')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with regex value: #{@last_value}"}
    page_select_regex @last_element, "label=#{@last_value}"

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVersion", get('@set_up')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with regex value: #{@last_value}"}
    page_select_regex @last_element, "label=#{@last_value}"

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVersion", get('@set_up')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with regex value: #{@last_value}"}
    page_select_regex @last_element, "label=#{@last_value}"

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlFuelType", get('@fuel')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with option value: #{@last_value}"}
    page_select @last_element, "label=#{@last_value}"

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlKmPerYear", get('@km_per_yr')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with label value: #{@last_value}"}
    page_select @last_element, "label=#{@last_value}"

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucVehicleData_ddlVehicleUse", get('@habitual_vehicle_use')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with option value: #{@last_value}"}
    page_select @last_element, "label=#{@last_value}"

    @last_element, @last_value = get('@alarm'), nil
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running option button element: #{@last_element}"}
    page_click @last_element

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_btnForward", nil
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running button element: #{@last_element}"}
    page_click @last_element
  	sleep @sleep*3

  end

  def page_2

#      wait_for_alert()

    @last_element, @last_value = get('@leasing'), nil
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running option button element: #{@last_element}"}
    page_click @last_element

    @last_element, @last_value = get('@client_type'), nil
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running option button element: #{@last_element}"}
    page_click @last_element

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlProvince", get('@residence_province')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with option value: #{@last_value}"}
    page_select @last_element, "label=#{@last_value}"

#    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlMunicipality", get('@residence')
#    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with option value: #{@last_value}"}
#    page_select @last_element, "label=#{@last_value}"

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlCountry", get('@citizenship')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with option value: #{@last_value}"}
    page_select @last_element, "label=#{@last_value}"

    @last_element, @last_value = get('@driver_sex'), nil
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running option button element: #{@last_element}"}
    page_click @last_element

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_txtBirthDate", get('@birth_date')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running text element: #{@last_element} with string value: #{@last_value}"}
    page_type @last_element, "#{@last_value}"

    @last_element, @last_value = "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPersonalData_ddlJob", get('@job')
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running combo element: #{@last_element} with regex value: #{@last_value}"}
    page_select_regex @last_element, "label=#{@last_value}"
    #sleep 5
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
    page_select_regex "ctl00_ContentPlaceHolderMainArea_SimulatorContentPlaceHolderMainArea1_ucPrizeValue_ddl_P01_Max", "label=" + $Massimale_RCA

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

    $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
    $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, @rate, premio)
    @logger.debug('QuixaTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
  end
	
	def page_click(element)
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => Click on element = #{element}"}
#	  wait_for_elm(element)
	  page.click element
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

	def page_type(element, label)
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => Type on element = #{element} a string = #{label}"}
	  wait_for_elm(element)
	  page.type element, label
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => element value = #{page.get_value(element)}"}
	end

	def page_select_regex(element, label)
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => Select from combo = #{element} a label using regex expression = #{label}"}
	  wait_for_select(element, label, "regex")
	  page.select element, label
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => element value = #{page.get_selected_value(element)}"}
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => visible element text = #{page.get_selected_label(element)}"}
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => all element options = #{page.get_select_options(element)}"}
	end

	def page_select(element, label)
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => Select from combo = #{element} a #{label}"}
	  wait_for_select(element, label)
	  page.select element, label
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => element value = #{page.get_selected_value(element)}"}
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => visible element text = #{page.get_selected_label(element)}"}
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => all element options = #{page.get_select_options(element)}"}
	end
	
  def wait_for_select(combo_name, label, regex = nil)
  	sleep @sleep
    raise RangeError, "Wait for select failed! Element cannot be nil" unless combo_name
    raise RangeError, "Wait for select failed! Label cannot be nil" unless label
    raise RangeError, "Wait for select failed! Label cannot be nil" unless label.gsub!("label=","")
	  wait_for_elm combo_name
	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => combo is present: #{page.element? combo_name}"}
	  assert !60.times{ break if (page.get_select_options(combo_name).include?(label)); sleep 1 }	unless regex
  end
  
  def wait_for_elm(name)
  	sleep @sleep
	  page.wait_for_element name
		assert !30.times{ break if (! page.is_visible("ctl00_UpdateProgress1")); sleep 1; @logger.debug(__FILE__ + ' => ' + method_name) \
                               {"#{@kte.company} => Waiting combo "+ name;} } \
                                if page.is_visible("ctl00_UpdateProgress1") \
                                if page.element? "ctl00_UpdateProgress1"
	  raise RangeError, "Wait for element failed! Element not present = #{name}" unless page.element? name
#	  @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => element name = #{name}"}
      
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

  def page_wait
   page.wait_for_page_to_load site.wait_for_page_to_load
  end

end
