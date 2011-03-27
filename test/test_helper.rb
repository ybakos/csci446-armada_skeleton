ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'test_help'
require 'authlogic/test_case'
require 'declarative_authorization/maintenance'
require 'faker'

class ActiveSupport::TestCase
  include Authorization::TestHelper
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
  fixtures :all
end

def faker_http_url
  "http://#{Faker::Lorem.words[0]}.com"
end
