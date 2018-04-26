source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '5.1.4'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'therubyracer', '0.12.3', platforms: :ruby
# Use Redis adapter to run Action Cable in production
gem 'jquery-rails'
gem 'redis', '~> 3.0'

# my gems
gem 'active_model_serializers', '0.10.7'
gem 'autoprefixer-rails'
gem 'bootstrap', '~> 4.1.0'
gem 'redis-rails', '5.0.2'
gem 'rspec', '3.7.0'
gem 'slim', '3.0.9'
gem 'slim-rails', '3.1.3'
gem 'sprockets', '3.7.1'

# JST
gem 'handlebars_assets', '0.23.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '4.8.2'
  gem 'faker'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
end

group :development do
  gem 'bullet'
  gem 'listen', '3.1.5'
  gem 'web-console', '3.5.1'
end

group :test do
  gem 'capybara', '2.16.1'
  gem 'capybara-webkit', '1.1.0'
  gem 'database_cleaner', '1.6.2'
  gem 'json_spec', '1.1.5'
  gem 'launchy', '2.4.3'
  gem 'rack_session_access', '0.1.1'
  gem 'shoulda-matchers', '3.1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
