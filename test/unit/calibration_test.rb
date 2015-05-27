require 'assert'
require './lib/models/calibration'

require 'assert/factory'

class CalibrationTest < Assert::Context
  desc "Calibration"
  setup do
    @luminance = "80.00"
    @x_value = ".3135"
    @y_value = ".3295"
    @attempts = 4
    @green = true 
    @date = Assert::Factory.time # assert helper
    @save = "yes" 
    
    @cal = Calibration.new
    @cal.luminance = @luminance
    @cal.x_value = @x_value
    @cal.y_value = @y_value
    @cal.attempts = @attempts
    @cal.green = @green
    @cal.date = @date.to_s # b/c of chronic
  end
  subject{ @cal }

  test "should know its attributes" do
    assert_equal @luminance, subject.luminance
    assert_equal @x_value, subject.x_value
    assert_equal @y_value, subject.y_value
    assert_equal @date, subject.date
    assert_equal @green, subject.green
    assert_equal @attempts, subject.attempts
  end
  
end

