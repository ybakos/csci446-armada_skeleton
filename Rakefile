require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'

# For heroku_san tasks, since Rake tasks are not auto-loaded from gems.
begin
  require 'heroku_san/tasks' if Rails.env == 'development'
rescue LoadError
  STDERR.puts "Run `rake gems:install` to install heroku_san"
end

# For DelayedJob tasks, since Rake tasks are not auto-loaded from gems.
begin
  gem 'delayed_job', '~>2.0.4'
  require 'delayed/tasks'
rescue LoadError
  STDERR.puts "Run `rake gems:install` to install delayed_job"
end
