source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"
gem "rails", "5.2.1"
gem "mongoid", "~> 7.0"

gem "sassc", "~> 2.2"
gem "uglifier", ">= 1.3.0"
gem "jbuilder", "~> 2.5"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.1.0", require: false
gem "haml-rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "listen"
  gem "rspec-rails", "~> 3.8"
  gem "mongoid-rspec", "~> 4.0"
  gem "database_cleaner"
end

group :development do
  gem "rubocop", require: false
  gem "web-console", ">= 3.3.0"
  gem "spring"
end

group :test do
  gem "capybara", ">= 2.15"
end
