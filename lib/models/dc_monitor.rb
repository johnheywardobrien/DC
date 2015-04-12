require 'bundler'
Bundler.require

# require './idea'
require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'


# foo.<tab> lists all methods available 

# .tag



class DCMonitor < ActiveRecord::Base
    has_many :calibrations
end

