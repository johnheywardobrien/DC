require File.expand_path '../../helper.rb', __FILE__

class CalibrationTest < Assert::Context
  

  test "1 equals 1" do
    assert_equal 1, 1
  end

  test "testing new calibration" do
  	cal = Calibration.new
    assert !cal.valid?
  end
  
  test "this test should pass" do
    cal = Calibration.new
    assert_equal(cal.luminance, 80.08)
  end
#   assert_equals( cross.trend, 0 )
# 16	    assert_equals( cross.cross, :none )
# 17	    assert_equals( cross.up?, false )
# 18	    assert_equals( cross.down?, false )


end




