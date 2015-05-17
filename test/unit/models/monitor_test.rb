require './test/test_helper'
require './lib/models/dream_color_monitor'

describe DreamColorMonitor do
  before do
    @dream_color_monitor = DreamColorMonitor.new(
      tag: '123456'
      )
    end
  end