source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18.4'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap_form'
gem 'jquery-turbolinks'                         #jQuery plugin for drop-in fix binded events problem caused by Turbolinks
gem 'devise'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'bundler-audit'

group :development, :test do
   gem "rspec-rails", '~> 3.5.2'
   gem 'rspec-its'
   gem 'rspec-html-matchers'
   gem 'fuubar'
   gem 'pry'
   gem 'pry-nav'
   gem 'pry-remote'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-nav'
  gem 'puma', '~> 3.0'
end

group :test do
  gem 'factory_girl_rails', '~> 4.4'
  gem 'mocha', :require => false
  gem 'guard-rspec'
  gem 'guard-minitest'
  gem "codeclimate-test-reporter", require: nil
end

group :production do
  gem 'rails_12factor' #heroku deployment
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
