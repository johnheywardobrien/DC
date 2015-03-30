require './test/test_helper'
require 'models/dream_color'

class DreamColor
  
  class UnitTests < MiniTest::Test

    def test_it_exists
      dream_color = DreamColor.new(:tag => '000123')
      assert_equal '000123', dream_color.tag
    end
  
  end
    
end
