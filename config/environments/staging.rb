config.cache_classes = true
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true
config.log_level = :debug
# config.logger = SyslogLogger.new
# config.cache_store = :mem_cache_store
# config.action_controller.asset_host = "http://assets.example.com"
# config.threadsafe!

config.action_mailer.default_url_options = { :host => "FIXME" }

# HTTP Basic Auth for staging (using Rack middleware)
config.middleware.insert_after(::Rack::Lock, "::Rack::Auth::Basic", "Staging") do |u, p|
  u == ENV['HTTPUSER'] && p == ENV['HTTPPASS']
end

