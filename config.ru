require 'bundler'
Bundler.require

require 'sinatra/activerecord'
require 'active_record'
require 'rake'


require './app'
require './lib/models/dream_color_monitor'
require './lib/models/calibration'

# run IdeaBoxApp
run DreamColorApp