require 'bundler'
Bundler.require


require 'sqlite3'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'
require 'time'
require 'date'
require 'sinatra/flash'
# require 'sinatra/redirect_with_flash'


require './lib/models/dream_color_monitor'
require './lib/models/calibration'




class DreamColorApp < Sinatra::Base
  set :method_override, true
  enable :sessions
  register Sinatra::Flash
  
  # index
  get '/' do
    erb :index
  end
  
  # error not found
  not_found do
    erb :error
  end
  
  # show page of all monitors
  get '/monitors' do
    @monitors = DreamColorMonitor.all 
    
    erb :monitors
  end    

  # filters in params to redirect to show page for a given monitors calibrations
  get '/calibrations' do
    if DreamColorMonitor.exists?(:tag => params[:tag])
      redirect "/monitors/#{params[:tag]}/calibrations"
    elsif params[:tag].blank?
      flash[:index_error] = "Please provide a valid tag number"
      redirect '/'
    elsif
      flash[:no_tag] = "That tag does not exist. Would you like to add it?"
      redirect '/'
    # elsif params[:tag].nil?
    #   flash[:index_error] = "Please provide a valid tag number"
    #   redirect '/'
    else
      redirect "/monitors/#{params[:tag]}/calibrations"
    end
  end
  
  # show page of calibrations for specific monitor
  get '/monitors/:tag/calibrations' do
    @monitor = DreamColorMonitor.find_by_tag(params[:tag])
    @calibrations = @monitor.calibrations
 
    erb :calibrations
  end
  
  # retrieve new calibration page
  get '/monitors/:tag/calibrations/new' do
    @monitor = DreamColorMonitor.find_by_tag(params[:tag])
    
    erb :calibration_new
  end


  # create and write new calibration 
  post '/monitors/:tag/calibrations/new' do
    @monitor = DreamColorMonitor.find_by_tag(params[:tag])
    @calibrations = @monitor.calibrations

    cal = Calibration.new
    cal.dream_color_monitor_id = @monitor.id
    cal.luminance = params[:lum_val]
    cal.x_value = params[:x_val]
    cal.y_value = params[:y_val]
    cal.attempts = params[:cal_attempts]
    cal.green = params[:green]
    cal.date = params[:date]
    
    cal.save
    
    redirect "/monitors/#{params[:tag]}/calibrations"
  end
    
  # retrieve new monitor page
  get '/monitors/new' do
    
    erb :monitor_new
  end
  
  # create and write new monitor
  post '/monitors/new' do
    mon = DreamColorMonitor.new
    mon.tag = params[:tag_new]
    
    mon.save
    if mon.tag.empty?
      flash[:failure] = "Please enter a tag number"
      redirect '/monitors/new'
    else
      flash[:success] = "You have created a new DreamColor"
      redirect '/monitors'
    end
  end
  
  
end


