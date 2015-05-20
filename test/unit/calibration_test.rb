require File.expand_path '../../helper.rb', __FILE__


class CalibrationTest < Assert::Context
  
    test "something" do
      assert_equal 1, 1
    end

end

puts "test"



# class CalibrationTest < MiniTest::Test

#   # include Rack::Test::Methods

#   # def app
#   #   DreamColorApp
#   # end

#   def test_index
#     get '/'
#     assert last_response.ok?
#     assert_equal "Hello, World!", last_response.body
#   end
# end