
require 'bundler'
Bundler.require

require './idea'
require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'


# dbconfig = YAML::load(File.open('database.yml'))
# ActiveRecord::Base.establish_connection(dbconfig)

require './lib/models/monitor'
require './lib/models/ideabox'


