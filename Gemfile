source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'jquery-rails'
gem 'dynamic_form'
gem 'rails-i18n'

gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem "omniauth-google-oauth2"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'twitter-bootstrap-rails'
end

group :development do
  gem 'cane'
  gem 'rails_best_practices'
end

group :test do
  gem 'rspec-rails'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'simplecov', :require => false
end

group :development, :test do
  gem 'debugger'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
