source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'jquery-rails'
gem 'dynamic_form'
gem 'rails-i18n'

gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'cane'
end

group :test do
  gem 'rspec-rails'
  gem 'guard-rails'
  gem 'guard-rspec'
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
