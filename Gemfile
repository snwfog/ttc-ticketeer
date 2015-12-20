source 'https://rubygems.org'

gem 'rack'
# Rails plucks
gem 'activemodel'
gem 'activerecord'
gem 'actionpack' # Required by actioncontroller in jsonapi serializer

gem 'active_model_serializers'

gem 'eldr'
gem 'jsonapi-resources'
gem 'jsonapi-serializers'

# gem 'slim'
# gem 'tilt'
# gem 'eldr-rendering'
# gem 'eldr-assets'

gem 'require_all'
gem 'virtus' # Allow for cooler model class

# User authentication
gem 'userapp'

# Server / Deployment / Infra / Setup
gem 'unicorn'
gem 'rake-remote_task'

# Monitoring / Instrumenting
# gem 'statsd-instrument'
# gem 'newrelic_rpm'

group :db do
  gem 'mysql'
  gem 'standalone_migrations'
  gem 'memoist'
  gem 'cityhash' # Fast hashing fns
end

group :development do
  gem 'shotgun'
  gem 'colorize'
end

group :test do
  gem 'rspec'
end
