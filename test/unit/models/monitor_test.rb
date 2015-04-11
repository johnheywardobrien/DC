require './test/test_helper'
require 'models/dc_monitor'

class DCMonitorTest < MiniTest::Test
 
    def test_it_exists
      dream_color = DCMonitor.new(:tag => '000123')
      assert_equal '000123', dream_color.tag
    end
  
end
