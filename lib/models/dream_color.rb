# http://tutorials.jumpstartlab.com/projects/idea_box.html
# http://tutorials.jumpstartlab.com/topics/sinatra_with_active_record.html
require 'bundler'
Bundler.require

require './idea'
require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'


class DcCal < ActiveRecord::Base
end

# .tag
# .luminance
# .x_value
# .y_value
# .attempts
# .date
# .green

# shows when first dream color was calibrated and what tag number it has
first_dc = DcCal.first
puts "The first dream color was calibrated on #{first_dc.date} and has tag
number #{first_dc.tag}."

# determine how many rows are in DcCal table  
# all_dcs = DcCal.count
all_dcs = DcCal.all 
puts "The size of the DcCal table is #{all_dcs.size}."

# list out last 5 dream colors to be calibrated by date
last_five_calibrated_dcs = DcCal.limit(5)

last_five_calibrated_dcs.each do |cal|
  puts "#{cal.tag} was calibrated on #{cal.date}."
end

# display how many dream colors are green
dc_green_yes = DcCal.where(:green => 'yes')
puts "There are #{dc_green_yes.count} Dream Colors that are green."