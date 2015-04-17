class Calibration < ActiveRecord::Base
  belongs_to :dream_color_monitor    # foreign key - dc_monitor_id
  
  # attr_reader :dream_color_monitor_id, :lum_val, :x_val, :y_val, :cal_attempts, 
  #             :green, :date
              
  # def initialize(dcm_id, lum_val, x_val, y_val, cal_attempts, green, date)  
  #   @dream_color_monitor_id = dcm_id
  #   @lum_val = lum_val
  #   @x_val = x_val
  #   @y_val = y_val
  #   @cal_attempts = cal_attempts
  #   @green = green
  #   @date = date
  # end
  
end
