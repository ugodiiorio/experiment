#############################################
#   	Created by Kubepartners			          #
#                                           #
#				01/03/2010						              #
#############################################

class LinearSect1 < Test::Unit::TestCase
  attr_reader :selenium_driver, :browser
  alias :site :browser
  alias :page :selenium_driver

  def get(var)
    return site.instance_variable_get(var)
  end
  def set(var, val)
    site.instance_variable_set(var, val)
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

      @rca_cover = "1"
      @verification_errors = []
#      const_publisher

      @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => Selenium port: #{@kte.port}"}
      @selenium_driver = Selenium::Client::Driver.new \
        :host => site.host,
        :port => site.port,
        :timeout_in_seconds => site.timeout_in_secs,
        :browser => site.browser,
        :url => "http://www.linear.it"

      @selenium_driver.start_new_browser_session
#      page.set_context("test_new")

#        it "can find Selenium" do
#          page.open "/"
#          page.title.should eql("Google")
#          page.type "q", "Selenium seleniumhq"
#          page.click "btnG", :wait_for => :page
#          page.value("q").should eql("Selenium seleniumhq")
#          page.text?("seleniumhq.org").should be_true
#          page.title.should eql("Selenium seleniumhq - Google Search")
#          page.text?("seleniumhq.org").should be_true
#                  page.element?("link=Cached").should be_true
#        end

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
      page_1
      @logger.info(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{@kte.test_result}"}

      #page.set_speed 2000
    rescue Timeout::Error => ex
      ex_message = "#{ex.class.to_s}: Selenium Timeout on element -> #{@last_element} - #{ex.message.to_s}"
      @logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex_message}"}
#      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    rescue Exception => ex
      ex_message = "#{ex.class.to_s}: Selenium error on element -> #{@last_element} - #{ex.message.to_s}"
      @logger.error(__FILE__ + ' => ' + method_name) {"#{@kte.company} => #{ex_message}"}
#      $writer.result_update("KO", ex_message)
      raise ex.class, ex_message
    end
  end

  def page_1

    @last_element = "/default.asp"
    @last_value = nil
    @logger.debug(__FILE__ + ' => ' + method_name) {"#{@kte.company} => now's running element: #{@last_element} with value: #{@last_value}"}
    page.open @last_element
    page.wait_for_page_to_load site.wait_for_page_to_load
    page.click "//img[@alt='Preventivi online: auto, moto e casa']"
    page.wait_for_page_to_load site.wait_for_page_to_load
    page.click "//img[@alt='Preventivo automobile']"
    @kte.rc_premium = 900
    @kte.test_result = "Test OK => New RCA price for profile #{@kte.profile} = #{@kte.rc_premium}"
#      click "/html/body/form/div[3]/div/div[3]/div/div/map[4]/area"
#      click   "//div[@id='hidepage']/div[1]/div[3]/div[1]/div[1]/map[3]/area"  #causa promozione feltrinelli si è spostato il bottone "fai preventivo" promozione in scadenza 14&/12/2009
#      page.wait_for_page_to_load $wait_for_page_to_load

  end

  def page_2

      if $Polizza_nuova_auto_nuova
        select "cond_ass_cb", "label="+	"Deve essere assicurata per la prima volta"
      else
        if $Polizza_nuova_auto_usata
          select "cond_ass_cb", "label="+									"Deve essere assicurata per la prima volta"
        else
          select "cond_ass_cb", "label="+									$Situazione_assicurativa_BM
        end
      end

      select "decorrenza_giorno", "label="+								$Data_decorrenza_giorno
        select "decorrenza_mese", "label="+								$Data_decorrenza_mese
        select "decorrenza_anno", "label="+								$Data_decorrenza_anno

      if $Polizza_nuova_auto_nuova
        select "frazionamento_cb", "label="+						$Frazionamento_polizza
        type "sinistri15anno_mese",											$N_sinistri_5_anni
        type "sinistri15anno_anno",											$N_sinistri_1_anno
      else
        if $Polizza_nuova_auto_usata
        else
          select "classe_merito_cb", "label="+						$Classe_BM
          select "frazionamento_cb", "label="+						$Frazionamento_polizza
          select "anni_continuita_ass", "label="+					'Sì'
          type "sinistri15anno_mese",											$N_sinistri_5_anni
          type "sinistri15anno_anno",											$N_sinistri_1_anno
        end
      end

      click "nextStep"
      page.wait_for_page_to_load $wait_for_page_to_load

      if $Polizza_nuova_auto_nuova
        select "imm_mese", "label="+										$Data_imm_classe_14_mese
        select "imm_anno", "label="+										$Data_decorrenza_anno
      else
        if $Polizza_nuova_auto_usata
          select "imm_mese", "label="+										$Data_immatricolazione_mese
          select "imm_anno", "label="+										$Data_immatricolazione_anno
        else
          select "imm_mese", "label="+										$Data_immatricolazione_mese
          select "imm_anno", "label="+										$Data_immatricolazione_anno
        end
      end

        select "marca_auto", "label="+										$Marca_auto
        select "modello_auto", "label="+									$Modello_auto
        select "allestimento_auto", "label="+								$Allestimento_auto
      click 																$Antifurto
        select "ricovero_auto", "label="+									$Ricovero_auto
        select "utilizzo_auto", "label="+									$Utilizzo_auto
        type "km_anno", 													$N_km
        click "nextStep"
        page.wait_for_page_to_load $wait_for_page_to_load

        select "nascita_giorno", "label="+									$Data_nascita_giorno
        select "nascita_mese", "label="+									$Data_nascita_mese
        select "nascita_anno", "label="+									$Data_nascita_anno
      click 																$Sesso
        select "patente_mese", "label="+									$Data_patente_mese
        select "patente_anno", "label="+									$Data_patente_anno
        select "eta_inferiore", "label="+									$N_eta_inferiore_26
      click 																$Conducente_is_proprietario
        type "comune_residenza", 											$Comune_residenza
        page.fire_event "comune_residenza", "blur"
        click "nextStep"
      page.wait_for_page_to_load $wait_for_page_to_load

        #click "//img[@alt='Ok']"
        select "nascita_giorno", "label="+									$Data_nascita_giorno
        select "nascita_mese", "label="+									$Data_nascita_mese
        select "nascita_anno", "label="+									$Data_nascita_anno
        type "comune_residenza", 											$Comune_residenza
        click "nextStep"
        page.wait_for_page_to_load $wait_for_page_to_load

        click "nextStep"
        page.wait_for_page_to_load $wait_for_page_to_load

      page.wait_for_element "massimale_1"
#      lab = page.get_selected_label "massimale_1"
#      @logger.debug('LinearTest.test_new => ' + $compagnia) {"Massimale RCA di default = "+lab}
#      if (lab != $Massimale_RCA)
#        select "massimale_1", "label="+ 								$Massimale_RCA
#        page.select "massimale_1", "label=regexp:€\\s2\\.500\\.000 - 500\\.000"
      select_regex "massimale_1", "label=" + $Massimale_RCA

#      end
      sleep 5
      premio = page.get_text("imp_massimale_1")
      #premio = page.get_text("totaleImporto")
      premio = premio.gsub(".","") if premio
      premio = premio.gsub(",",".") if premio
      @logger.debug('LinearTest.test_new => ' + $compagnia) {"gsub premio = " + premio.to_s}
      raise RangeError, "Price cannot be nil" unless premio

      raise RangeError, "Price cannot be equal to zero" unless premio.to_i > 0

      $writer.result_update("OK", "New price for profile " + $profilo_assicurativo + " = " + premio)
      $writer.profile_price( $profilo_assicurativo, $compagnia, @garanzia, $rilevazione, premio)
      @logger.debug('LinearTest.test_new => ' + $compagnia) {"PREMIO = "+ premio}
    end
	
	def select_regex(element, label)
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"      ...la label con regex = "+label}
	  wait_for_select(element, label, "regex")
	  page.select element, label
	end

	def select(element, label)
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"Seleziona da combo = "+element}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_select(element, label)
	  page.select element, label
	end
	
	def click(element)
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"Click su elemento = "+element}
	  wait_for_elm(element)
	  page.click element
	end  
	
	def type(element, label)
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"Scrivi su elemento = "+element}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"      ...la label = "+label}
	  wait_for_elm(element)
	  page.type element, label
	end     
  
  def wait_for_select(nome_elemento_combo, label, regex = nil)
    @last_element = nome_elemento_combo
    sleep $sleep
  	if(nome_elemento_combo==nil)
  		@logger.error('LinearTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento_combo inesistente !!"}
  	end
  	if(label==nil)
  		@logger.error('LinearTest.test_new => ' + $compagnia) {"Attenzione ! label inesistente!!"}
  	end
    label= label.gsub!("label=","")
    if(label==nil)
      @logger.error('LinearTest.test_new => ' + $compagnia) {"Attenzione ! Label non formattata correttamente !!"}
    end
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"Nome combo = "+nome_elemento_combo}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"Label = "+label}
	  wait_for_elm nome_elemento_combo
	  var = page.element? nome_elemento_combo
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"Combo presente ? "+var.to_s()+"  label  "+label}
	  assert !60.times{ break if (page.get_select_options(nome_elemento_combo).include?(label)); sleep 1 }	unless regex
  end
  
  def wait_for_elm(nome_elemento)
    @last_element = nome_elemento
	  sleep $sleep
	  if(nome_elemento==nil)
		  @logger.error('LinearTest.test_new => ' + $compagnia) {"Attenzione ! Nome_elemento inesistente !!"}
	  end	  
	  page.wait_for_element nome_elemento
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"Nome elemento = "+nome_elemento}
	  var = page.element? nome_elemento
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"Elemento presente ? "+var.to_s()}
  end	  
  
  def const_publisher
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Situazione_assicurativa_BM = " + $Situazione_assicurativa_BM}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Comune_residenza 	 =	" +		$Comune_residenza}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_nascita	 =	" +		$Data_nascita}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_nascita_giorno	 =	" +		$Data_nascita_giorno}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_nascita_mese	 =	" +		$Data_nascita_mese}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_nascita_anno	 =	" +		$Data_nascita_anno}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_patente	 =	" +		$Data_patente}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_patente_mese	 =	" +		$Data_patente_mese}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_patente_anno	 =	" +		$Data_patente_anno}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_immatricolazione	 =	" +		$Data_immatricolazione}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_immatricolazione_mese	 =	" +		$Data_immatricolazione_mese}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Data_immatricolazione_anno	 =	" +		$Data_immatricolazione_anno}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Sesso	 =	" +		$Sesso}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$N_sinistri_5_anni	 =	" +		$N_sinistri_5_anni}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$N_sinistri_1_anno	 =	" +		$N_sinistri_1_anno}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Classe_BM  	 =	" +		$Classe_BM}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Marca_auto  	 =	" +		$Marca_auto}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Modello_auto  	 =	" +		$Modello_auto}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"$Allestimento_auto  	 =	" +		$Allestimento_auto}
	  @logger.debug('LinearTest.test_new => ' + $compagnia) {"profilo " + $profilo_assicurativo}
    @logger.debug('LinearTest.test_new => ' + $compagnia) {"Data_decorrenza_giorno = "+ 		$Data_decorrenza_giorno}
		@logger.debug('LinearTest.test_new => ' + $compagnia) {"Data_decorrenza_mese = "+ 			$Data_decorrenza_mese}
    @logger.debug('LinearTest.test_new => ' + $compagnia) {"Data_decorrenza_anno = "+ 			$Data_decorrenza_anno}
  end
    
end

