source 'https://rubygems.org'

# Rails plucks
gem 'activemodel'
gem 'activerecord'

gem 'rack'
gem 'slim'
gem 'tilt'
gem 'eldr'
gem 'eldr-rendering'
gem 'eldr-assets'

gem 'virtus' # Allow for cooler model class

# User authentication
gem 'userapp'

# Server / Deployment / Infra / Setup
gem 'unicorn'
gem 'rake-remote_task'

# Monitoring / Instrumenting
gem 'statsd-instrument'
# gem 'newrelic_rpm'

# Development / Debugging
gem 'colorize'

gem 'active_model_serializers'

group :db do
  gem 'mysql'
  gem 'standalone_migrations'
  gem 'memoist'
  gem 'cityhash' # Fast hashing fns
end

group :development do
  gem 'shotgun'
end

group :test do
  gem 'rspec'
end
