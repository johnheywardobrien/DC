require 'assert'
require './lib/models/calibration'

class DreamColorMonitorTest < Assert::Context
  desc "DreamColorMonitor"
  setup do
    @tag = "123456"
    
    @mon = DreamColorMonitor.new
    @mon.tag = @tag
  end
  subject{ @mon }
  
  test "should know it's tag" do
    assert_equal @tag, subject.tag 
  end

end