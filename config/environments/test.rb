config.cache_classes = true
config.whiny_nils = true
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false
config.action_view.cache_template_loading            = true
config.action_controller.allow_forgery_protection    = false
# See ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test
config.action_mailer.default_url_options = { :host => "localhost" }

# HTTP Basic Auth for test env (using Rack middleware)
config.middleware.insert_after(::Rack::Lock, "::Rack::Auth::Basic", "Staging") do |u, p|
  u == 'test' && p == 'test'
end

config.gem "faker"

config.after_initialize do
  PaperTrail.enabled = false
end
