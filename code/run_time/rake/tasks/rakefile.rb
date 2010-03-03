
require 'rubygems'
require 'selenium/rake/tasks' # use selenium rc rake tasks that are bundled with the selenium-client gem

SELENIUM_RC_JAR = Dir[File.dirname(__FILE__) + "/selenium/selenium-server*.jar"].first
#SELENIUM_RC_JAR = Dir["/var/lib/gems/1.8/gems/Selenium-1.1.14/lib/selenium/openqa/selenium-server*.jar.txt"].first
# Start selenium server task
Selenium::Rake::RemoteControlStartTask.new(:'rc:start') do |rc|
 rc.port = 4444
 rc.timeout_in_seconds = 3 * 60
 rc.background = true
 rc.wait_until_up_and_running = true
 rc.jar_file = SELENIUM_RC_JAR
 rc.additional_args << " -singleWindow"
# rc.additional_args << " -multiWindow -firefoxProfileTemplate FirefoxProfile"

end

# Stop selenium server task
Selenium::Rake::RemoteControlStopTask.new(:'rc:stop') do |rc|
 rc.host = "localhost"
 rc.port = 4444
 rc.timeout_in_seconds = 3 * 60
end

# Restart selenium server task
desc "Restart Selenium Remote Control"
task :'rc:restart' do
 Rake::Task[:"rc:stop"].execute [] rescue nil
 Rake::Task[:"rc:start"].execute []
end

#
selenium_jar_file_path = SELENIUM_RC_JAR #'selenium-server-1.0-beta-2/selenium-server.jar'
selenium_server_log_path = "rc_at_#{Time.now.strftime "%C%y_%m_%d_%H%M%S"}.log"
vanilla_selenium_server_log_path = "vanilla_rc_at_#{Time.now.strftime "%C%y_%m_%d_%H%M%S"}.log"

desc "start a selenium-rc server that can handle SSL and cross-domain requests"

Selenium::Rake::RemoteControlStartTask.new("rc:log") do |rc|
  rc.port = 4444
  rc.timeout_in_seconds = 2 * 60
  rc.background = true
  rc.wait_until_up_and_running = true
  rc.jar_file = selenium_jar_file_path
  rc.log_to = selenium_server_log_path
  rc.additional_args << "-proxyInjectionMode"
  rc.additional_args << "-trustAllSSLCertificates"
  rc.additional_args << "-avoidProxy"
end

desc "start the selenium-rc server"

Selenium::Rake::RemoteControlStartTask.new("rc") do |rc|
  rc.port = 4444
  rc.timeout_in_seconds = 2 * 60
  rc.background = true
  rc.wait_until_up_and_running = true
  rc.jar_file = selenium_jar_file_path
  rc.log_to = vanilla_selenium_server_log_path
end