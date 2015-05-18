require './app.rb'
require './test/test_helper'
# require File.expand_path '../test_helper.rb', __FILE__

class TestApp < MiniTest::Test

  include Rack::Test::Methods

  def app
    DreamColorApp
  end

  def test_DreamColorApp
    get '/'
    assert last_response.ok?
    assert_equal last_response.body, "index"
  end
end