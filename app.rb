# http://tutorials.jumpstartlab.com/projects/idea_box.html
require './idea'
require 'bundler'
Bundler.require

class IdeaBoxApp < Sinatra::Base
  set :method_override, true

  get '/' do
    erb :index, locals: {ideas: Idea.all}
  end
  
  not_found do
    erb :error
  end
  
  post '/' do
    # 1: create an idea
    idea = Idea.new(params['idea_title'], params['idea_description'])    
    # 2: store it
    idea.save
    # 3: send us back to index to see all ideas
    redirect '/'
  end
  
  delete '/:id' do |id|
    Idea.delete(id.to_i)
    redirect '/'
  end
  
  get '/:id/edit' do |id|
    idea = Idea.find(id.to_i)
    erb :edit, locals: {id: id, idea: idea}
  end
  
  put '/:id' do |id|
    data = {
      :title => params['idea_title'],
      :description => params['idea_description']
    }
    Idea.update(id.to_i, data)
    redirect '/'
  end


end