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


  # filters in params to redirect to show page for a given monitors calibrations
  get '/calibrations' do
    p(params)
    redirect "/monitors/#{params[:tag]}/calibrations"
  end
  
    # show page of calibrations for specific monitor
  get '/monitors/:tag/calibrations' do
    m = DreamColorMonitor.find_by_tag(params[:tag])
    @calibrations = m.calibrations
 
    erb :calibrations
  end
  
  # redirect to add new calibration
  get '/calibrations/new' do
    p(params)
    redirect "/monitors/#{params[:tag]}/calibrations/new"
  end
  
  # add new calibration
  get 'monitors/:tag/calibrations/new' do
    @tag = DreamColorMonitor.get(params[:tag])
    
    
    erb :calibration_new
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


