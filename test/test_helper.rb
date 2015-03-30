$:.unshift File.expand_path("../..", __FILE__)
$:.unshift File.expand_path("../../lib", __FILE__)

require 'minitest/autorun'

require 'active_record'
db_options = {adapter: 'sqlite3', database: 'dreamcolor_test'}
ActiveRecord::Base.establish_connection(db_options)

require 'db/schema'