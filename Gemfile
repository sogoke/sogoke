source 'http://rubygems.org'
# Default Rails gems
gem 'rails', '3.1.0'
gem 'rake', '0.9.2'

# CSS and JavaScript gems
gem 'sass-rails', "~> 3.1.0.rc"
gem 'coffee-script'
gem 'uglifier'
gem 'jquery-rails'

# Database, File System, Cache
gem "bson_ext", ">= 1.3.1"
gem "mongoid", ">= 2.1.2"
gem "mongoid_acts_as_tree"
gem "mongoid_taggable"
gem "sunspot_mongoid"

gem "aws-ses", :require => "aws/ses"

gem 'fog'
gem 'mini_magick'
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'

gem "redis"
gem "redis-store", ">= 1.0.0.rc1"
gem "resque", ">= 1.18.2"

# Devise for auth
gem "devise", ">= 1.4.2"

# Using thin server
gem "thin"

#Validation
gem 'client_side_validations'

# Gems for test
gem "rspec-rails", ">= 2.6.1", :group => [:development, :test]
gem "pry", :group => [:development, :test]
group :test do
  gem "database_cleaner", ">= 0.6.7"
  gem "mongoid-rspec", ">= 1.4.4"
  gem "factory_girl_rails", ">= 1.1.rc1"
  gem "capybara", ">= 1.0.0"
  gem "launchy", ">= 0.4.0"
  gem "guard-rspec"
end

