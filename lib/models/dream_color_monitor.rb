class DreamColorMonitor < ActiveRecord::Base
  has_many :calibrations
  
  validates :tag, format: { with: /\A\d{6}\z/, message: "Please enter a 6 digit tag nubmer" }

end