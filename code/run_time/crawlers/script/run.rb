#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__))

MAIN = 'kte.rb'
require("#{File.join(File.dirname(__FILE__))}/#{MAIN}")

puts "Start of KTE run script"
kte = KTE.new
kte.run
kte = nil
puts "End of KTE run script"
