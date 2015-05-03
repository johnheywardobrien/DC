require './test/test_helper'
require './lib/models/calibration'

describe Calibration do
  before do
    @calibration = Calibration.new(
      luminance: '80.80',
      x_value: '.3434',
      y_value: '.1231',
      attempts: 1,
      green: true,
      date: Time.current
    )
  end
  
  it 'must have a valid model' do
    @calibration.valid?.must_equal true
  end
  
  describe 'validations' do
    after { @calibration.valid?.must_equal false }
    
    describe 'luminance' do
      it 'must be invalid' do
        @calibration.luminance = 'bad value'
      end
    end
    
    describe 'x_value' do
      it 'must be invalid' do
        @calibration.x_value = 'bad value'
      end
    end
    
    describe 'y_value' do
      it 'must be invalid' do
        @calibration.y_value = 'bad value'
      end
    end
    
    describe 'attempts' do
      describe 'when value below 1' do
        it 'must be invalid' do
          @calibration.attempts = 0
        end
      end
    
      describe 'when value above 100' do
        it 'must be invalid' do
          @calibration.attempts = 101
        end
      end
    end
    
    describe 'green' do
      it 'must be invalid' do
        @calibration.green = nil
      end
    end
    
    describe 'date' do
      it 'must be invalid' do
        @calibration.date = nil
      end
    end
  end
end
