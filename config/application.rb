require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module SabageApp
  class Application < Rails::Application
    config.load_defaults 5.2
    # 追記
    #i18n
    config.i18n.default_locale = :ja
  end
end
