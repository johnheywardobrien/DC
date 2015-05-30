require 'bundler'
Bundler.require

require 'dotenv'
Dotenv.load

if ENV['RACK_ENV'] == 'production'
  require 'pg'
else
  require 'sqlite3'
end

require 'sinatra/base'
require 'sinatra/activerecord'
require 'active_record'
require 'rake'
require 'time'
require 'date'
require 'sinatra/flash'
require 'json'
require 'chronic'
require 'mail'
require 'assert'

require './lib/models/dream_color_monitor'
require './lib/models/calibration'

# puts ENV['DATABASE_URL']
db = URI.parse(ENV['DATABASE_URL'])

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

#UGH UGH UGH

  


class DreamColorApp < Sinatra::Base
  

  configure do
  
    register Sinatra::Flash
    set :method_override, true
    enable :sessions
    set :sessions => true
    set :environment, :development
  end

  
  use Rack::Auth::Basic, "Are you the Calibrator Master?" do |username, password|
    [username, password] == ['calibrator', 'llama']  
  end
  
  # index
  get '/' do
    
    erb :index, :layout => :layout
  end
  
  # error not found
  not_found do
    erb :error
  end
  
  # show page of metrics
  get '/metrics' do
    @last_five_cal = Calibration.limit(5).count
    @dc_green_yes = Calibration.where(:green => 'true').count
    @things = "this is a test" 
    @cal = Calibration.all  
    @marked_for_cal = @cal.joins(:dream_color_monitor)
                          .where(["calibrations.date < ?", 76.days.ago])
                          .pluck("dream_color_monitors.tag")
                          
    # need to figure out how to add conditional to limit searches to
    # last record only. If the last record is less than 76 days, i don't 
    # care about it
    
    erb :metrics
  end
  
  # show page of all green monitors
  get '/monitors/green' do
    @green_monitors = Calibration.where(:green => 'true')
    
    erb :green
  end
  
  # show page of all monitors
  get '/monitors' do
    @monitors = DreamColorMonitor.order("created_at DESC")
    
    erb :monitors
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
  
  # filters in params to redirect to show page for a given monitors calibrations
  get '/calibrations' do
    if DreamColorMonitor.exists?(:tag => params[:tag])
      redirect "/monitors/#{params[:tag]}/calibrations"
    elsif params[:tag].blank?
      flash[:index_error] = "Please provide a valid tag number"
      redirect '/'
    elsif
      flash[:no_tag] = "Tag ##{params[:tag]} does not exist. Would you like to add it?"
      redirect "/?tag=#{params[:tag]}"
    else
      redirect "/monitors/#{params[:tag]}/calibrations"
    end
  end
  
  # show page of calibrations for specific monitor
  get '/monitors/:tag/calibrations' do
    @monitor = DreamColorMonitor.find_by_tag(params[:tag])
    @calibrations = @monitor.calibrations
 
    erb :calibrations, :layout => :layout
  end
  
  # retrieve new calibration page
  get '/monitors/:tag/calibrations/new' do
    @monitor = DreamColorMonitor.find_by_tag(params[:tag])
    @cal = Calibration.new
    @error_msgs = []

    erb :calibration_new, :layout => :layout, :locals => { :error_msgs => @error_msgs }
    
  end


  # create and write new calibration 
  post '/monitors/:tag/calibrations/new' do
    @monitor = DreamColorMonitor.find_by_tag(params[:tag])
    @calibrations = @monitor.calibrations

    @cal = Calibration.new
    @cal.dream_color_monitor_id = @monitor.id
    @cal.luminance = params[:lum_val]
    @cal.x_value = params[:x_val]
    @cal.y_value = params[:y_val]
    @cal.attempts = params[:cal_attempts]
    @cal.green = params[:green]
    @cal.date = params[:date]
    
    @cal.save
    
    p @cal

    if @cal.valid?
      redirect "/monitors/#{params[:tag]}/calibrations"
      else
        @error_msgs = @cal.errors.messages.inject([]) do |msgs, (field, field_errors)|
          msgs << "#{field}: #{field_errors.join(', ')}"
          msgs
      end
      
      # pass above params to locals
      erb :calibration_new, :layout => :layout, :locals => { :error_msgs => @error_msgs  }
    end
  end
end


