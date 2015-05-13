source 'https://rubygems.org'
ruby "2.1.5"

gem 'rake'
gem 'sinatra', require: 'sinatra/base'
gem 'shotgun'
gem 'puma'

gem 'activerecord'

gem 'sinatra-activerecord'
gem 'sinatra-flash'
gem 'humanize_boolean'

group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem "activerecord-postgresql-adapter"
end

#