# https://github.com/thoughtbot/suspenders
require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Appizer
  class AppGenerator < Rails::Generators::AppGenerator
    class_option :database, type: :string, aliases: "-d", default: "postgresql",
      desc: "Configure for selected database (options: #{DATABASES.join("/")})"

    class_option :skip_bundle, type: :boolean, aliases: "-B", default: false,
      desc: "Don't run bundle install"

    class_option :skip_test_unit, type: :boolean, aliases: "-T", default: true,
      desc: "Skip Test::Unit files"

    class_option :force, type: :boolean, aliases: "-f", default: true,
      desc: "Overwrite files that already exist"

    class_option :locales, type: :array, default: ['fr', 'en'],
      desc: "Available locales (default locale comes first)"

    class_option :drop, type: :boolean, default: false,
      desc: 'Drop current table before migration'

    class_option :ruby_version, type: :string, default: '2.2.3',
      desc: 'Set Ruby version used'

    class_option :git_ssl_verify, type: :boolean, default: false,
      desc: 'Verify Git server SSL Certificate (might be problematic for self-signed certificate)'

    protected

    def get_builder_class
      Appizer::AppBuilder
    end
  end
end
