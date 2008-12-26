#!/usr/bin/env ruby

$KCODE = 'u'

$:.unshift(File.dirname(__FILE__) + "/lib")

require 'termtter'
require 'termtter/stdout'
require 'configatron'

configatron.set_default(:update_interval, 300)
configatron.set_default(:debug, false)

conf_file = File.expand_path('~/.termtter')
if File.exist? conf_file
  load conf_file
else
  puts <<EOS
The configuration file does not exist.
Example: 
# ~/.termtter
configatron.user_name = USERNAME
configatron.password = PASSWORD
EOS
  exit 1
end

client = Termtter::Client.new(
  :user_name        => configatron.user_name,
  :password         => configatron.password,
  :update_interval  => configatron.update_interval,
  :debug            => configatron.debug
)
client.run

