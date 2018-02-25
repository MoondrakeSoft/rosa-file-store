source 'https://rubygems.org'

gem 'app'
gem 'carrierwave'
gem 'kaminari'
gem 'puma'
gem 'rails'
gem 'dotenv-rails'

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
  # deploy
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-deploy', require: false
  gem 'capistrano3-puma', '1.2.1', require: false
  # net-ssh requires the following gems for ed25519 support:
  gem 'rbnacl', '>= 3.2', '< 5.0', require: false
  #gem 'rbnacl-libsodium', require: false
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0', require: false
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
