class Calibration < ActiveRecord::Base
  belongs_to :dream_color_monitor    # foreign key - dc_monitor_id
  
  validates :green, :format => {:with => ^[yes|no]}
                 :message => "not that" 
               
  
end
