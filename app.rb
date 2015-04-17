require 'bundler'
Bundler.require


require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'


require './lib/models/dream_color_monitor'
require './lib/models/calibration'


class DreamColorApp < Sinatra::Base

  set :method_override, true
  
  # index
  get '/' do
    erb :index
  end
  
  # show page of all monitors
  get '/monitors' do
    # pass in all Dream Colors
    @monitors = DreamColorMonitor.all 
    
    erb :monitors
  end    
  
  # error not found
  not_found do
    erb :error
  end


  # calibrations
  
  # not working
  get '/monitors/:tag/calibrations' do
    @cal = Calibration.get(params[:dream_color_monitor_id])

    erb :calibrations
  end
  
  # this is definitely not finished!!!
  post 'monitors/:tag/calibrations' do
    monitor = DreamColorMonitor.find_by(params[:tag])
    
    # create new calibration
    cal = Calibration.new
    # store that bad boy
    cal.save
    # send us back to see all calibrations for :tag
    redirect '/monitors/:tag/calibrations'
  end
    

end


