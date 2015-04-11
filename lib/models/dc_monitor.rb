require 'bundler'
Bundler.require

require './idea'
require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'


# puts Monitor.superclass.inspect

class DCMonitor < ActiveRecord::Base
    has_many :calibrations
end

