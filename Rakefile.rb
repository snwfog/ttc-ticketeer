require 'standalone_migrations'

# Allow rake task to run db migration
StandaloneMigrations::Tasks.load_tasks

task :default => [:start]

desc 'start'
task :start do
  sh 'USER_APP=5658a40ff167b USER_APP_API_TOKEN=c3LAdYB5STWPOnrpIlYVhQ shotgun config.ru'
end

desc 'test'
task :test do
  sh 'USER_APP=5658a40ff167b USER_APP_API_TOKEN=c3LAdYB5STWPOnrpIlYVhQ rspec tests/app_test.rb'
end



