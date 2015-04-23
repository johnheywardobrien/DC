class Calibration < ActiveRecord::Base
  belongs_to :dream_color_monitor    # foreign key - dc_monitor_id
  
  validates :luminance, format: { with: /\b\d{2}\.\d{2}\b/, message: "Please type in values like xx.xx" }
  validates :x_value, format: { with: /\A\.\d{4}\z/, message: "Please type valid input for X Value" }            
  validates :y_value, format: { with: /\A\.\d{4}\z/, message: "Please type valid input for Y Value" }            
  validates :attempts, format: { with: /\d{1,2}(?!\d)|100/  , message: "Please enter a number from 0-100" }
  validates :green, format: { with: /(yes|no)/, message: "Please only type yes or no" }

end
