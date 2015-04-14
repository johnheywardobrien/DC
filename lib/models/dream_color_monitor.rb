class DreamColorMonitor < ActiveRecord::Base
    has_many :calibrations
    # accepts_nested_attributes_for :calibrations
end