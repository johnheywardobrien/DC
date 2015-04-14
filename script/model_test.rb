require 'bundler'
Bundler.require

require 'sqlite3'
require 'sinatra/activerecord'

require './lib/models/dream_color_monitor'
require './lib/models/calibration'

# begin
#   m = DCMonitor.find_by_tag(params['monitor_tag'])
# rescue ActiveRecord::NotFound
#   halt 404
# end
# m = DreamColorMonitor.create(:tag => 'abc123')
m = DreamColorMonitor.first

c = Calibration.new
c.dream_color_monitor = m
c.luminance = '80.38' 
c.x_value = '.3145' 
c.y_value = '.3266'
c.attempts = "3" 
c.date = '041515' 
c.green = 'yes' 

c.save

m.reload

puts c
puts m
puts m.calibrations