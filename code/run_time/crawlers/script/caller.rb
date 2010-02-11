require "rubygems"
require "test/unit"
require "test/unit/ui/console/testrunner"

require "Companies_parameters/quixa.rb"
require "Companies_parameters/dialogo.rb"
require "Companies_parameters/genertel.rb"
require "Companies_parameters/directline.rb"
require "Companies_parameters/genialloyd.rb"
require "Companies_parameters/linear.rb"
require "Companies_parameters/zurich.rb"
require "Companies_parameters/conte.rb"

class Caller
	def initialize(profilo_assicurativo, compagnia, port , rilevazione )
		@profilo_assicurativo, $profilo_assicurativo = profilo_assicurativo, profilo_assicurativo
		@compagnia, $compagnia = compagnia, compagnia
		@port, $port = port, port
		@id_test, $id_test = Time.new().to_s(), Time.new().to_s()
    @rilevazione, $rilevazione = rilevazione, rilevazione

		$sleep = 0
		if !($sleep_input == 0)
			$sleep = $sleep_input.to_i + 0.01*rand(200)
		end

		$browser = "*chrome"
#		$browser = "*safari"
		$time_out = $timeout_in_seconds

    begin
      @ep = {:profilo_assicurativo => @profilo_assicurativo, :compagnia => @compagnia, :id_test => @id_test, :port => @port , :rilevazione => @rilevazione}

      $writer 				= Writer.new(@ep)
      @reader 				= Reader.new()
      @reader_const			= Table_reader_constants.new()
    rescue Exception => ex
      @@logger.fatal('Caller.initialize => ' + @compagnia) {ex.message}
      raise
    end
	end
	
	def executor()

    begin
      mysql = Mysql.init()
      mysql = Mysql.real_connect($db_ip, $db_conn_user, $db_conn_pwd, "Quixa_scheduler")
    rescue Exception => ex
      @@logger.fatal('Caller.executor => ' + @compagnia) {ex.message}
      raise
    end

		compagnia_ext = "Chk_"+ @compagnia
		profilo_assicurativo = @profilo_assicurativo.to_s()
		
		res = mysql.query("UPDATE scheduler_" + $source + " SET "+ compagnia_ext +" = 'LOCKED' WHERE id_profilo_assicurativo = '"+ profilo_assicurativo + "';")
		res = mysql.query("SELECT "+ compagnia_ext +" FROM scheduler_" + $source + " WHERE id_profilo_assicurativo = '"+ profilo_assicurativo + "' FOR UPDATE;")				
		
		@reader.table_reader()
		@reader_const.table_reader()
		$writer.result_new
		
#		nome_file = "Logs/TestResults_profili" + $source + "_" + @profilo_assicurativo + "_" + $compagnia + "_" + @port.to_s() + ".txt"
#    dir_name = File.dirname(File.expand_path(__FILE__)).to_s + "/"
#		trace_file = dir_name + "Logs/profilo_" + @profilo_assicurativo + "_" + @compagnia + "_" + @port.to_s() + ".txt"

		@@logger.info('Caller.executor => ' + @compagnia) {"Starting test case with id_test = " + @id_test.to_s() + \
                                                          " for profile "+ @profilo_assicurativo}
    begin
      $Result_file = File.new($selenium_io, "a") unless $selenium_io == STDOUT
      $Result_file = $selenium_io if $selenium_io == STDOUT
#      $Result_file = File.open(trace_file, "a") unless $selenium_out_level == 0
      @@logger.debug('Caller.executor => ' + @compagnia) {"Test case log file initializing ..."}

      case @compagnia
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

      @@logger.info('Caller.executor => ' + @compagnia) {result.to_s}
      passed = result.passed?
      
#      $Result_file = File.open(trace_file, "a")

      if passed
        res = mysql.query("UPDATE scheduler_" + $source + " SET "+ compagnia_ext +" = 'OK' WHERE id_profilo_assicurativo = '"+ profilo_assicurativo + "';")
#        $Result_file.puts("\nExecution for company " + @compagnia.upcase + " and profile " + @profilo_assicurativo + " PASSED")
        @@logger.info('Caller.executor => ' + @compagnia) {"Execution for profile " + @profilo_assicurativo + " PASSED"}
      else
        res = mysql.query("UPDATE scheduler_" + $source + " SET "+ compagnia_ext +" = 'KO' WHERE id_profilo_assicurativo = '"+ profilo_assicurativo + "';")
#        $Result_file.puts("\nExecution for company " + @compagnia.upcase + " and profile " + @profilo_assicurativo + " NOT PASSED")
        @@logger.info('Caller.executor => ' + @compagnia) {"Execution for profile " + @profilo_assicurativo + " NOT PASSED"}
      end

      $Result_file.close unless $Result_file.closed? || $Result_file == STDOUT
    rescue Exception => ex
      @@logger.fatal('Caller.executor => ' + @compagnia) {ex.message}
      raise
    ensure
      $Result_file.close unless $Result_file.closed? || $Result_file == STDOUT
    end

		return passed

	end

end
