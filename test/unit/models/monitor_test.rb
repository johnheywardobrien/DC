require './test/test_helper'
require './lib/models/dream_color_monitor'

class DCMonitorTest < MiniTest::Test
 
    def test_it_exists
      dream_color = DreamColorMonitor.new(:tag => '000123')
      assert_equal '000123', dream_color.tag
    end
  
end
