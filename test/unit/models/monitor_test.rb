require './test/test_helper'
require 'models/dc_cal'

class DcCal
  
  class UnitTests < MiniTest::Test

    def test_it_exists
      dream_color = DcCal.new(:tag => '000123')
      assert_equal '000123', dream_color.tag
    end
  
  end
    
end
