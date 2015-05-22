require 'assert'
require './lib/models/calibration'

require 'assert/factory'

class CalibrationTest < Assert::Context
  desc "Calibration"
  setup do
    @luminance = "80.00"
    @date = Assert::Factory.time # assert helper
    @x_value = ".3135"
    
    @cal = Calibration.new
    @cal.luminance = @luminance
    @cal.date = @date.to_s # b/c of chronic
    @cal.x_value = @x_value
  end
  subject{ @cal }

  test "should know its attributes" do
    assert_equal @luminance, subject.luminance
    assert_equal @date, subject.date
    assert_equal @x_value, subject.x_value
  end
  
end




