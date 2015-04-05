# http://tutorials.jumpstartlab.com/projects/idea_box.html
# http://tutorials.jumpstartlab.com/topics/sinatra_with_active_record.html
require 'bundler'
Bundler.require

require './idea'
require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'


class DreamColor < ActiveRecord::Base
end
