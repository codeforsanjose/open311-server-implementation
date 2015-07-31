source 'https://rubygems.org'

ruby '2.2.2'

group :heroku do
  gem 'rails_12factor'
end

gem 'rails', '4.2.3'
gem 'rails-api'
gem 'pg'
gem 'puma'
gem 'uuid'

gem 'pry-rails'
gem 'awesome_print'

group :test do
  gem 'simplecov'
end

group :development do
  gem 'spring', platforms: [ :mri ]

  gem 'better_errors'
  gem 'binding_of_caller', platforms: [ :mri ]
  gem 'brakeman'
  gem 'sandi_meter'
  gem 'railroady'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'fabrication'
  gem 'faker'
end
