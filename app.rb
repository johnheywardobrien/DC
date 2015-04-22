require 'bundler'
Bundler.require


require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'
require 'time'


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
    p(params)
    @monitor = DreamColorMonitor.find_by_tag(params[:tag])
    @calibrations = @monitor.calibrations
 
    erb :calibrations
  end
  
  # add new calibration
  get '/monitors/:tag/calibrations/new' do
    @monitor = DreamColorMonitor.find_by_tag(params[:tag])
    
    
    erb :calibration_new
  end


  # create and write new calibration to database
  post '/monitors/:tag/calibrations/new' do
    # set instance variables
    @monitor = DreamColorMonitor.find_by_tag(params[:tag])
    @calibrations = @monitor.calibrations
    # create new calibration
    cal = Calibration.new
    cal.dream_color_monitor_id = @monitor.id
    cal.luminance = params[:lum_val]
    cal.x_value = params[:x_val]
    cal.y_value = params[:y_val]
    cal.attempts = params[:cal_attempts]
    cal.green = params[:green]
    cal.date = params[:date]
    p(params)
    # store that bad boy
    cal.save
    # send us back to see all calibrations for :tag
    redirect "/monitors/#{params[:tag]}/calibrations"
  end
    
  # create a new monitor  
  get '/monitors/new' do
    
    erb :monitor_new
  end
  
  post '/monitors/new' do
    # create new monitor in database
    mon = DreamColorMonitor.new
    mon.tag = params[:tag_new]
    # save that bad boy
    mon.save
    # send us to list of all monitors
    redirect '/monitors'
  end
  
  
end


