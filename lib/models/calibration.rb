require 'bundler'
Bundler.require

require './idea'
require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'

# .x_value
# .y_value
# .attempts
# .date
# .green
# .luminance

class Calibration < ActiveRecord::Base
  belongs_to :monitors     # foreign key - monitor_id
end

# testing git cache
# still testing?