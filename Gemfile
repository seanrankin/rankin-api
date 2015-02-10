source 'https://rubygems.org'

gem 'rails', '4.1.7'
gem 'rails-api'
gem 'pg'
gem 'jbuilder'

group :production, :staging do
  gem "rails_12factor"
end

group :development do
  gem "quiet_assets"
  gem "spring"
  gem "foreman"
  gem "guard"
  gem "guard-rspec"
  gem "guard-livereload", :require => false
end

group :test, :development do
  gem "factory_girl_rails"
  gem "rspec-rails"
end
