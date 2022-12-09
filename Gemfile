source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
#ruby '2.6.3'
ruby '2.7.6'
# Use sqlite3 as the database for Active Record
gem 'devise'
#gem 'sqlite3'
# Use Puma as the app server
gem "puma"
# Use SCSS for stylesheets
#gem 'sass-rails', '~> 5.0'
gem 'sassc'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem "nokogiri", ">= 1.10.8"

#bootstrap it up
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'

#for image uploading
gem 'carrierwave'
gem 'mini_magick'
gem 'fog-aws'

#for counting queries
gem 'sql_queries_count'

gem 'mimemagic', '~> 0.4.3'

gem 'pg', '~> 0.21'
#gem 'pg', '~> 1.4', '>= 1.4.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  #gem 'sqlite3', '~> 1.3.6'
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor'
  gem 'wkhtmltopdf-heroku'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
