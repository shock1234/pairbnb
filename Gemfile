source 'https://rubygems.org'
# Declare a ruby version for heroku deploy
ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'faker'
# User authentication
gem 'clearance'

# Privacy Protection
gem 'figaro'

# Facebook Log in
gem 'omniauth'

gem 'omniauth-facebook'

#paginate
gem 'will_paginate', '~> 3.1.0'

#braintree payment
gem 'braintree'

#file upload
gem 'carrierwave', '~> 1.0'
#adding different versions for the same file (e.g. thumbnails)
#Note: You must have Imagemagick and MiniMagick installed to do image resizing. MiniMagick is a Ruby interface for Imagemagick which is a C program. This is why MiniMagick fails on 'bundle install' without Imagemagick installed.
gem 'mini_magick'
#Amazon S3
gem 'carrierwave-aws'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use bootstap-sass gem to enable bootstrap and scss
gem 'bootstrap-sass', '~> 3.3.6'
#Tooltips and popovers depend on tether for positioning
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end
#datepicker gems
gem 'jquery-ui-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

#mailer
#letter_opener allows us to simulate the process of sending the email by creating it as a temporary file. That way we will avoid sending the actual email over the network, which is messy and brittle to test.
gem "letter_opener", :group => :development
#Launchy automatically opens the created temp file in a browser window so that the sending process becomes automatic and we have real-time confirmation that the email was sent correctly.
gem "launchy"

#background job
gem 'sidekiq'
# gem 'sinatra', :require => nil #sidekiq uses sinatra, set require to nil or else server wont run
gem 'sinatra', github: 'sinatra/sinatra' #bundle sinatra from source, bcs there will be dependency issue with older version

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'


# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
