require 'bundler'
Bundler.require

require './idea'
require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'

class Monitor < ActiveRecord::Base
end




