#############################################
#   	Created by Kubepartners			          #
#                                           #
#				17/03/2010						              #
#############################################

class ZurichConnectSect1 < Test::Unit::TestCase
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
#      page_2
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

    open_page(@url) #url="http://www.zurich-connect.it/default.aspx?Target=AssicurazioneAuto"

    click_button "//img[@alt='Fai il preventivo']"
    page_wait

  end

  def page_2

      select "ddlFonteConoscenza", "label="+							$Conoscenza_Zurich

      if $Polizza_nuova_auto_nuova
        select "//option[@value='1040']"
      else
        if $Polizza_nuova_auto_usata
          select "ddlSituazioneAssicurativa", "label="+					"Sto acquistando un'auto usata e mi assicuro per la prima volta"
        else
          select "ddlSituazioneAssicurativa", "label="+					$Situaziona_assicurativa
        end
      end

      type "txtDataDecorrenzaPolizza", 								$Data_decorrenza
      type "txtDataScadenza", 										$Data_decorrenza
      select "ddlContraenteProp", "label="+							$Contraente_is_proprietario= "SI"
        click "Avanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        click "//div[@id='domanda1']/p[2]"
        click 															$Sesso
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        type "txtDataNascita", 											$Data_nascita
        select "ddlNazionalita", "label="+								$Nazionalita
        select "ddlstatociv2", "label="+								$Stato_civile
        select "ddlTitoloStudio", "label="+								$Titolo_studio_Zurich
        select "ddlprofessione", "label="+								$Professione
        type "txtCapResidenza", 										$Cap
        click "btnLocalita"

        @selenium.wait_for_page_to_load $wait_for_page_to_load
      select "ddlLocalita", "label="+									$Comune_residenza

        click "Avanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      sleep 3
        select "ddlAlimentazione", "label="+							$Alimentazione
      sleep 3
      if $Polizza_nuova_auto_nuova
        select "ddlMeseImm", "label="+									$Data_decorrenza_mese
        sleep 3
        select "ddlAnno", "label="+										$Data_decorrenza_anno
        sleep 3
      else
        if $Polizza_nuova_auto_usata
          select "ddlMeseImm", "label="+									$Data_immatricolazione_mese
          sleep 3
          select "ddlAnno", "label="+										$Data_immatricolazione_anno
          sleep 5
        else
          select "ddlMeseImm", "label="+									$Data_immatricolazione_mese
          sleep 3
          select "ddlAnno", "label="+										$Data_immatricolazione_anno
          sleep 5
        end
      end

        select "ddlMarca", "label="+									$Marca_auto
      sleep 5
        select "ddlModello", "label="+									$Modello_auto
        sleep 3
      select "ddlAllestimento", "label="+								$Allestimento_auto
        click "Avanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        select "ddlAntifurto", "label="+								$Antifurto
      type 	"txtValoriVeicoli", 									"5000"
        select "ddlanti", "label="+										$Antifurto2
      select "ddlGancioTraino", "label="+								$No_gancio_traino
      select "ddlStabiliz", "label="+									$No_stabilizzatore
      select "ddlABS", "label="+ 										$Si_ABS
      select "ddlairbag", "label="+									$Si_airbag
        click "Avanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      if $Polizza_nuova_auto_nuova
      else
        if $Polizza_nuova_auto_usata
        else
          select "ddlClasseUniversale", "label="+							$Classe_BM
          click "//option[@value='"+										$N_sinistri_5_anni+"']"
        end
      end
        click "btnAvanti"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

        click "//img[@alt='Calcola il premio']"
        @selenium.wait_for_page_to_load $wait_for_page_to_load

      @selenium.wait_for_element "ddlMassimaleRCA"
      lab = @selenium.get_selected_label "ddlMassimaleRCA"
      @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
      if (lab.strip != $Massimale_RCA.strip)
        select "ddlMassimaleRCA", "label="+ 						$Massimale_RCA
        sleep 3
      end
      click $No_incendio_furto
      click $No_infortuni_conducente
      click "btnCalcola"
      @selenium.wait_for_page_to_load $wait_for_page_to_load

      premio = @selenium.get_text("lblvPremioAnnualeLordoSconto")
      #premio = @selenium.get_text("lblvPremioAnnualeLordo")
      str = premio.split
      premio = str[0]
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio
      #premium2 = @selenium.get_text("//div[@id='lblvPremioAnnualeLordo']")
      @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      raise RangeError, "Price cannot be nil" unless premio

      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @@logger.debug('ZurichTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    rescue Timeout::Error => ex
      ex_message = ex.class.to_s + " => Selenium timeout on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('ZurichTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = ex.class.to_s + " => Selenium error on element -> " + @last_element + " - " + ex.message.to_s
      @@logger.error('ZurichTest.test_new => ' + $compagnia) {ex_message}
      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
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
