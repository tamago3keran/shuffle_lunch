source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.5"
gem "rails", "6.0.0"
gem "mongoid", ">= 7.0.5"

gem "sassc", "~> 2.2"
gem "uglifier", ">= 1.3.0"
gem "jbuilder", "~> 2.5"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.1.0", require: false
gem "haml-rails", "~> 2.0"
gem "kaminari", "~> 1.1"
gem "kaminari-mongoid", "~> 1.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "listen"
  gem "rspec-rails", ">= 3.9"
  gem "mongoid-rspec", ">= 4.0.1"
  gem "database_cleaner"
end

group :development do
  gem "rubocop", ">= 0.75", require: false
  gem "web-console", ">= 4.0.0"
  gem "spring"
end

group :test do
  gem "capybara", ">= 2.15"
end
