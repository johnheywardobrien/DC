require 'bundler'
Bundler.require

require './idea'
require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'


# adding rows to DcCals table by way of DcCal class

class DcCal < ActiveRecord::Base
end

new_dc = DcCal.new

new_dc.tag = "100354"
new_dc.luminance = "80.87"
new_dc.x_value = ".3134"
new_dc.y_value = ".3291"
new_dc.attempts = "date"
new_dc.green = "no"

puts new_dc.inspect

