require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module SabageApp
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :ja
    config.generators do |g|
      g.assets false 
      g.helper false
      g.test_framework :rspec,
                      view_specs: false,
                      helper_specs: false,
                      routing_specs: false,
                      controller_specs: true,
                      request_specs: false,
                      fixtures: true
    end
  end
end
