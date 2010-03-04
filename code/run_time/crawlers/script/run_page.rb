require "rubygems"
require "test/unit"
require "test/unit/ui/console/testrunner"

#require "modules/quixa.rb"
#require "modules/dialogo.rb"
#require "modules/genertel.rb"
#require "modules/directline.rb"
#require "modules/genialloyd.rb"
#require "modules/linear.rb"
#require "modules/zurich.rb"
#require "modules/conte.rb"

module RunPage

  MODULE_FOLDER = 'modules'
  DLN_LIBRARY_PATH = File.join(File.dirname(__FILE__), '..', MODULE_FOLDER)

	def page_setup()

    begin

      load(File.join(DLN_LIBRARY_PATH, @provider, @sector) + '/' + @company + ".rb")

      module_name = @company + '_' + @sector
      include Kernel.const_get(module_name.camelize)

      $sleep_typing +=  0.01*rand(200) if $sleep_typing < 1

      $browser = "*chrome" #"*safari"

      @DB = Sequel.mysql(:database => $db_default, :user => $db_conn_user, :password => $db_conn_pwd, :host => $db_ip)
      @DB.loggers << @logger
      ds = @DB.from(:sect_1).filter(:key_insurance_profiles_id_num => :$p1,
                                      :key_provider_id_str => :$p2,
                                      :key_sector_id_str => :$p3,
                                      :key_company_id_str => :$p4,
                                      :key_working_set_id_str => :$p5)
      ps = ds.prepare(:select, :select_by_sector)
      ps.call(:p1=>@profile, :p2=>@provider, :p3=>@sector, :p4=>@company, :p5=>@working_set).each do |row|
        row.each do |k, v|
          puts k
          puts v
        end
      end

      k = DB.from(:profiles_personal_data).count
      one_of_people = (rand(k) +1).to_i
      ds = @DB.from(:profiles_personal_data).filter(:key_profiles_id_num => :$p1, :own_owner_specification_str => :$p2)
      ps = ds.prepare(:select, :select_by_sex)
      ps.call(:p1=>one_of_people, :p2=>"M").each do |row|
        row.each do |k, v|
          puts k
          puts v
        end
      end

      #      $writer 				= Writer.new(@ep)
#      @reader 				= Reader.new()
#      @reader_const			= Table_reader_constants.new()
    rescue Exception => ex
      @logger.fatal('RunPage.initialize => ' + @company) {ex.message}
      raise
    end
    
	end
	
	def executor()

    begin
      mysql = Mysql.init()
      mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_scheduler")
    rescue Exception => ex
      @logger.fatal('RunPage.executor => ' + @company) {ex.message}
      raise
    end

		compagnia_ext = "Chk_"+ @company
		profilo_assicurativo = @profilo_assicurativo.to_s()
		
		res = mysql.query("UPDATE scheduler_" + $source + " SET "+ compagnia_ext +" = 'LOCKED' WHERE id_profilo_assicurativo = '"+ profilo_assicurativo + "';")
		res = mysql.query("SELECT "+ compagnia_ext +" FROM scheduler_" + $source + " WHERE id_profilo_assicurativo = '"+ profilo_assicurativo + "' FOR UPDATE;")				
		
		@reader.table_reader()
		@reader_const.table_reader()
		$writer.result_new
		
#		nome_file = "Logs/TestResults_profili" + $source + "_" + @profilo_assicurativo + "_" + $compagnia + "_" + @port.to_s() + ".txt"
#    dir_name = File.dirname(File.expand_path(__FILE__)).to_s + "/"
#		trace_file = dir_name + "Logs/profilo_" + @profilo_assicurativo + "_" + @company + "_" + @port.to_s() + ".txt"

		@logger.info('RunPage.executor => ' + @company) {"Starting test case with id_test = " + @id_test.to_s() + \
                                                          " for profile "+ @profilo_assicurativo}
    begin
      $Result_file = File.new($selenium_io, "a") unless $selenium_io == STDOUT
      $Result_file = $selenium_io if $selenium_io == STDOUT
#      $Result_file = File.open(trace_file, "a") unless $selenium_out_level == 0
      @logger.debug('RunPage.executor => ' + @company) {"Test case log file initializing ..."}

      case @company
        when "conTe"
          result = Test::Unit::UI::Console::TestRunner.new(ConTeTest, $selenium_out_level, io=$Result_file).start()
        when "dialogo"
          result = Test::Unit::UI::Console::TestRunner.new(DialogoTest, $selenium_out_level, io=$Result_file).start()
        when "directLine"
          result = Test::Unit::UI::Console::TestRunner.new(DirectLineTest, $selenium_out_level, io=$Result_file).start()
        when "genertel"
          result = Test::Unit::UI::Console::TestRunner.new(GenertelTest, $selenium_out_level, io=$Result_file).start()
        when "genialloyd"
          result = Test::Unit::UI::Console::TestRunner.new(GenialloydTest, $selenium_out_level, io=$Result_file).start()
        when "linear"
          result = Test::Unit::UI::Console::TestRunner.new(LinearTest, $selenium_out_level, io=$Result_file).start()
        when "quixa"
          result = Test::Unit::UI::Console::TestRunner.new(QuixaTest, $selenium_out_level, io=$Result_file).start()
        when "zurich"
          result = Test::Unit::UI::Console::TestRunner.new(ZurichTest, $selenium_out_level, io=$Result_file).start()
      end

      @logger.info('RunPage.executor => ' + @company) {result.to_s}
      passed = result.passed?
      
#      $Result_file = File.open(trace_file, "a")

      if passed
        res = mysql.query("UPDATE scheduler_" + $source + " SET "+ compagnia_ext +" = 'OK' WHERE id_profilo_assicurativo = '"+ profilo_assicurativo + "';")
#        $Result_file.puts("\nExecution for company " + @company.upcase + " and profile " + @profilo_assicurativo + " PASSED")
        @logger.info('RunPage.executor => ' + @company) {"Execution for profile " + @profilo_assicurativo + " PASSED"}
      else
        res = mysql.query("UPDATE scheduler_" + $source + " SET "+ compagnia_ext +" = 'KO' WHERE id_profilo_assicurativo = '"+ profilo_assicurativo + "';")
#        $Result_file.puts("\nExecution for company " + @company.upcase + " and profile " + @profilo_assicurativo + " NOT PASSED")
        @logger.info('RunPage.executor => ' + @company) {"Execution for profile " + @profilo_assicurativo + " NOT PASSED"}
      end

      $Result_file.close unless $Result_file.closed? || $Result_file == STDOUT
    rescue Exception => ex
      @logger.fatal('RunPage.executor => ' + @company) {ex.message}
      raise
    ensure
      $Result_file.close unless $Result_file.closed? || $Result_file == STDOUT
    end

		return passed

	end

end
