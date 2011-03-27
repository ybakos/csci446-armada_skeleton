require 'compass'
require 'compass/app_integration/rails'
require 'fileutils'

# See http://devcenter.heroku.com/articles/using-compass
FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets"))

Rails.configuration.middleware.insert_after(Rack::Lock,
                                            Rack::Static,
                                            :urls => ['/stylesheets'],
                                            :root => "#{Rails.root}/tmp")

Compass::AppIntegration::Rails.initialize!
