require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "action_mailer/railtie"
require "active_job/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "sprockets-derailleur"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Appizer
  class Application < Rails::Application
    initializer :regenerate_require_cache, before: :load_environment_config do
      Bootscale.regenerate
    end

    config.middleware.use Middleware::Obfuscator

    config.railties_order = [:all, Nice::Engine, :main_app]

    config.to_prepare do
      # Load application's model / class decorators
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      Dir.glob(File.join(File.dirname(__FILE__), "../lib/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.time_zone = 'Eastern Time (US & Canada)'

    config.i18n.default_locale = :fr
    config.i18n.available_locales = [:fr, :en]

    # config.active_job.queue_adapter = :que TODO :sidekiq
    config.active_record.schema_format = :sql

    config.action_view.embed_authenticity_token_in_remote_forms = true

    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.paths << Rails.root.join("vendor", "assets", "fonts")
    config.assets.precompile += %w( .svg .eot .woff .ttf)

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Compiler options

    # Opal
    # config.opal.method_missing      = true
    # config.opal.optimized_operators = true
    # config.opal.arity_check         = false
    # config.opal.const_missing       = true
    # config.opal.dynamic_require_severity = :ignore

    # Enable/disable /opal_specs route
    # config.opal.enable_specs = true

    # The path to opal specs from Rails.root
    # config.opal.spec_location = 'spec-opal'
  end
end
