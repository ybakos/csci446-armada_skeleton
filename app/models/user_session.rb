class UserSession < Authlogic::Session::Base
  # This is necessary because of an authlogic bug when using http auth and Rack httpauth middleware.
  allow_http_basic_auth false
end