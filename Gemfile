source 'https://rubygems.org'

ruby '2.2.3'

gem 'app'
gem 'carrierwave'
gem 'dalli'
gem 'kaminari'
gem 'puma'
gem 'rails',                          '4.2.5'

# DB
gem 'connection_pool'
gem 'pg'
gem 'transaction_retry'

# HTML, JS, CSS
gem 'bootstrap-sass',                 '2.3.2.0'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails-backbone',                 '~> 0.7.2'
gem 'sass-rails'
gem 'slim-rails'
gem 'uglifier'

group :production do
end

group :development do
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'web-console'
end

group :development, :test do
  gem 'byebug'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'thin'
end

group :test do
  gem 'ffaker',                         require: false
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end
