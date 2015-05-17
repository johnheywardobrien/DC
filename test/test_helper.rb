$:.unshift File.expand_path("../..", __FILE__)
$:.unshift File.expand_path("../../lib", __FILE__)



ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
# require File.expand_path '../app_test.rb', __FILE__

require 'active_record'
db_options = {adapter: 'sqlite3', database: 'dreamcolor_test'}
ActiveRecord::Base.establish_connection(db_options)

require 'db/schema'   




