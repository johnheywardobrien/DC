require './test/test_helper'
require './lib/models/calibration'

describe Calibration do
  before do
    @calibration = Calibration.new(
      luminance: '80.80',
      x_value: '.3434',
      y_value: '.1231',
      attempts: 1
    )
  end
  
  describe 'validations' do
    it 'must have a valid model' do
      @calibration.valid?.must_equal true
    end
    
    describe 'luminance' do
      it 'must be invalid' do
        @calibration.luminance = 'bad value'
        @calibration.valid?.must_equal false
      end
    end
    
    describe 'x_value' do
      it 'must be invalid' do
        @calibration.x_value = 'bad value'
        @calibration.valid?.must_equal false
      end
    end
    
    describe 'y_value' do
      it 'must be invalid' do
        @calibration.y_value = 'bad value'
        @calibration.valid?.must_equal false
      end
    end
    
     describe 'attempts' do
       describe 'when value below 1' do
        it 'must be invalid' do
          @calibration.attempts = 0
          @calibration.valid?.must_equal false
        end
      end
      
      describe 'when value above 100' do
        it 'must be invalid' do
          @calibration.attempts = 101
          @calibration.valid?.must_equal false
        end
      end
    end
  end
end
