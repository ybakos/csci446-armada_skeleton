require 'test_helper'

class AuthenticationTest < ActionController::IntegrationTest
  fixtures :all

  # Replace this with your real tests.
  test "try viewing site without being authenticated" do
    get "/"
    assert_response 401
  end
  
  test "authenticate via http and be shown the login screen" do
    get "/", nil, :authorization => ActionController::HttpAuthentication::Basic.encode_credentials("test", "test")
    assert_response 200
  end
  
end
