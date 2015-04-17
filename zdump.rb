# # .tag
# # .luminance
# # .x_value
# # .y_value
# # .attempts
# # .date
# # .green

# # shows when first dream color was calibrated and what tag number it has
# first_dc = DcCal.first
# puts "The first dream color was calibrated on #{first_dc.date} and has tag
# number #{first_dc.tag}."

# # determine how many rows are in DcCal table  
# # all_dcs = DcCal.count
# all_dcs = DcCal.all 
# puts "The size of the DcCal table is #{all_dcs.size}."

# # list out last 5 dream colors to be calibrated by date
# last_five_calibrated_dcs = DcCal.limit(5)

# last_five_calibrated_dcs.each do |cal|
#   puts "#{cal.tag} was calibrated on #{cal.date}."
# end

# # display how many dream colors are green
# dc_green_yes = DcCal.where(:green => 'yes')
# puts "There are #{dc_green_yes.count} Dream Colors that are green."

# puts "Here are all of the Dream Colors in the database:"
# puts DcCal.all


# new_dc = DcCal.new

# new_dc.tag = "100354"
# new_dc.luminance = "80.87"
# new_dc.x_value = ".3134"
# new_dc.y_value = ".3291"
# new_dc.attempts = "date"
# new_dc.green = "no"

# # new_dc.save
# # puts new_dc.inspect

# --------------------------------------------------------------------------

# |||||||| Original routes from Old IdeaBoxApp

# require './lib/models/idea'


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