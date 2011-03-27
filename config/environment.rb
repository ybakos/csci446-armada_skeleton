RAILS_GEM_VERSION = '2.3.11' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  # Do not declare gems here! We're using bundler. See Gemfile.

  config.autoload_paths += %W( #{RAILS_ROOT}/app/sweepers #{RAILS_ROOT}/app/mailers )

  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  config.time_zone = 'UTC'

end

Haml::Template.options[:attr_wrapper] = '"'
