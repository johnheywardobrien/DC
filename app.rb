require 'bundler'
Bundler.require

require 'dotenv'
Dotenv.load

if ENV['RACK_ENV'] == 'production'
  require 'pg'
else
  require 'sqlite3'
end

require 'sinatra/activerecord'
require 'active_record'
require 'rake'
require 'time'
require 'date'
require 'sinatra/flash'
require 'json'
require 'chronic'

require './lib/models/dream_color_monitor'
require './lib/models/calibration'

puts ENV['DATABASE_URL']
db = URI.parse(ENV['DATABASE_URL'])
# db = URI.parse('postgres://thmaqxvjdcuseh:skz6ZHdkjoVwMb9phNuDOm_E6s@ec2-50-19-233-111.compute-1.amazonaws.com:5432/dbif8qqqtkpv7l')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

#UGH



class DreamColorApp < Sinatra::Base
  set :method_override, true
  enable :sessions
  register Sinatra::Flash
  set :environment, :production
  
  # index
  get '/' do
    
    erb :index, :layout => :layout
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
    # @this = "ERROR"
    
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


