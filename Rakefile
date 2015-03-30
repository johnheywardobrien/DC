require 'rubygems'
require 'bundler/setup'
require 'rake/testtask'

ROOT_PATH = File.expand_path('../app', __FILE__)
$LOAD_PATH.unshift(ROOT_PATH)

require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

task default: :test


