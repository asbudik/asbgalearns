require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
  scheduler.every '3h' do
    Site.do_something
end