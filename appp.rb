require 'bundler'
Bundler.require


require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'


require './lib/models/dream_color_monitor'
require './lib/models/calibration'
require './lib/models/idea'




class DreamColorApp < Sinatra::Base

  set :method_override, true
  
  # landing page
  get '/' do
    # pass in all Dream Colors
    @monitors = DreamColorMonitor.find(1) 
    erb :index_2
  end
  
  not_found do
    erb :error
  end
  
  # monitors 
  
  get '/monitors/:tag' do
    # display individual tag
    @tag = DreamColorMonitor.find_by(tag: "abc123")
  end
  
  get '/monitors/:tag/calibrations' do
  end

  # calibrations
  
  post 'monitors/:tag/calibrations' do
    # 1: create new calibration
    cal = Calibration.new
    # 2: store that bad boy
    cal.save
    # 3: send us back to see all calibrations for :tag
    redirect '/monitors/:tag/calibrations'
  end
    

end

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  