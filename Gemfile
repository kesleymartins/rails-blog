source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.2"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'devise', '~> 4.2'
gem 'pagy', '~> 5.10'
gem 'noticed', '~> 1.5', '>= 1.5.7'
gem 'ransack', '~> 2.4', '>= 2.4.2'
gem 'rolify', '~> 6.0'
gem 'pundit', '~> 2.1'
gem 'friendly_id', '~> 5.4', '>= 5.4.2'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'faker', '~> 2.19'
end

group :development do
  gem "web-console"
  gem 'bullet', '~> 7.0', '>= 7.0.1'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
