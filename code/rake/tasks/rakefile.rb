#require 'rubygems'
#require 'rake'

desc "Run the acceptance tests, starting/stopping the selenium server."
task :acceptance => ['acceptance:selenium:start'] do
  begin
#	Rake::Task['acceptance:selenium:start'].invoke
#	Rake::Task['acceptance:run'].invoke
  ensure
	Rake::Task['acceptance:selenium:stop'].invoke
  end
end
namespace :acceptance do
  desc "Run the acceptance tests, assuming the selenium server is running."
#  task :run do
#	system 'ruby stories/all.rb'
#  end
  namespace :selenium do
	desc "Start the selenium server"
	task :start do
	  pid = fork do
		exec 'java -jar selenium/selenium-server.jar'
		exit! 127
	  end
	  File.open SELENIUM_SERVER_PID_FILE, 'w' do |f|
		f.puts pid
	  end
	  # wait a few seconds to make sure it's finished starting
	  sleep 5
	end
	desc "Stop the selenium server"
	task :stop do
	  if File.exist? SELENIUM_SERVER_PID_FILE
		pid = File.read(SELENIUM_SERVER_PID_FILE).to_i
		Process.kill 'TERM', pid
	  sleep 3
		FileUtils.rm SELENIUM_SERVER_PID_FILE
	  else
		puts "#{SELENIUM_SERVER_PID_FILE} not found"
	  end
	end
  end
end
private
SELENIUM_SERVER_PID_FILE = 'tmp/pids/selenium_server.pid'

