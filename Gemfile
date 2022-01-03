ruby "3.0.2"

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails"

gem "active_hash"
gem "bcrypt"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "inline_svg"
gem "jsbundling-rails"
gem "puma"
gem "sprockets-rails"
gem "turbo-rails"

group :development, :test do
  gem "byebug"
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "launchy"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :development do
  gem "listen"
  gem "standard"
  gem "spring"
  gem "web-console"
end
