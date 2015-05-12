require 'bundler'
Bundler.require

require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'
require 'pg'


require './app'
require './lib/models/dream_color_monitor'
require './lib/models/calibration'

# run IdeaBoxApp
run DreamColorApp