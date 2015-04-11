require 'bundler'
Bundler.require

require './idea'
require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'


class Calibration < ActiveRecord::Base
  belongs_to :monitors     # foreign key - monitor_id
end