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
  
  # this currently works
  get '/' do
    erb :index_2
  end
  
  get '/monitors' do
    # pass in all Dream Colors
    @monitors = DreamColorMonitor.all 
    
    erb :monitors
  end    
  
  not_found do
    erb :error
  end
  
  # Monitors
  
  get '/monitors/:tag' do
    # display individual tag
    m = DreamColorMonitor.find_by(tag: params['tag'])
    @tag = m.calibrations { |calibrations| puts calibrations}
    
    erb :monitor_tag
  end
  
  
  # calibrations
  
  get '/monitors/:tag/calibrations' do
    
    erb params[:tag].to_sym
    
    erb :monitors_tag
  end
  
  post 'monitors/:tag/calibrations' do
    @monitor = DreamColorMonitor.find_by(params[:tag])
    
    # create new calibration
    cal = Calibration.new
    # store that bad boy
    cal.save
    # send us back to see all calibrations for :tag
    redirect '/monitors/:tag/calibrations'
  end
    

end


# class IdeaBoxApp < Sinatra::Base
  
#   set :method_override, true

#   get '/' do
#     erb :index, locals: {ideas: Idea.all}
#   end

#   # not_found do
#   #   erb :error
#   # end
  
#   post '/' do
#     # 1: create an idea
#     idea = Idea.new(params['idea_title'], params['idea_description'])    
#     # 2: store it
#     idea.save
#     # 3: send us back to index to see all ideas
#     redirect '/'
#   end
  
#   delete '/:id' do |id|
#     Idea.delete(id.to_i)
#     redirect '/'
#   end
  
#   get '/:id/edit' do |id|
#     idea = Idea.find(id.to_i)
#     erb :edit, locals: {id: id, idea: idea}
#   end
  
#   put '/:id' do |id|
#     data = {
#       :title => params['idea_title'],
#       :description => params['idea_description']
#     }
#     Idea.update(id.to_i, data)
#     redirect '/'
#   end
  
#   # Monitors
  
  
#   # Calibrations
  
  
  
# end