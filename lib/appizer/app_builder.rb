module Appizer
  class AppBuilder < Rails::AppBuilder
    include Appizer::Helpers
    include Appizer::Manifest

    def readme
      template 'README.md'
    end

    def gitignore
      template '.gitignore'
    end

    def leftovers
      template '.ruby-version'
      copy_file 'Guardfile' unless options.api?
      copy_file 'provision'
      template  'Vagrantfile'

      after_bundle do
        update_manifest if options.update_manifest?
        check_manifest!

        configure_assets unless options.api?
        configure_mailers
        configure_models unless options.api?
        configure_policies unless options.api?
        configure_views unless options.api?
        configure_backup
        configure_deploy
        configure_environments
        configure_initializers
        configure_locales
        configure_sunzi
        configure_application
        configure_boot
        configure_database_yml if options[:database] == 'postgresql'
        configure_routes
        configure_schedule
        configure_secrets_yml
        configure_settings_yml
        configure_migrate unless options.api?
        configure_tasks
        configure_spec

        unless options.skip_git?
          git :init
          git add: '.'
          git commit: "-m 'first commit'"
          git checkout: "-b 'develop'"
          git config: "http.sslVerify '#{options.git_ssl_verify}'"
        end
      end
    end

    private

    def configure_assets
      directory   'app_tt/assets', 'app/assets'
      remove_file 'app/assets/javascripts/application.js'
      remove_file 'app/assets/javascripts/cable.js'
      remove_file 'app/assets/stylesheets/application.css'
      directory   'public_tt', 'public'
      directory   'vendor_tt', 'vendor'
      remove_file 'vendor/assets/javascripts/.keep'
      remove_file 'vendor/assets/stylesheets/.keep'
    end

    def configure_mailers
      directory 'app_tt/mailers', 'app/mailers'
    end

    def configure_models
      directory 'app_tt/models', 'app/models'
    end

    def configure_policies
      directory 'app_tt/policies', 'app/policies'
    end

    def configure_views
      directory   'app_tt/views', 'app/views'
      remove_file 'app/views/layouts/application.html.erb'
    end

    def configure_backup
      invoke 'runnee:install'
    end

    def configure_deploy
      copy_file 'Capfile'
      template  'config_tt/deploy.rb', 'config/deploy.rb'
      directory 'config_tt/deploy', 'config/deploy'
      invoke    'capi_recipes:install'
    end

    def configure_environments
      template  'config_tt/environments/development.rb', 'config/environments/development.rb'
      template  'config_tt/environments/production.rb', 'config/environments/production.rb'
      template  'config_tt/environments/production.rb', 'config/environments/staging.rb'
      gsub_file 'config/environments/staging.rb', "#{app_dashed_name}.com", "test.#{app_dashed_name}.com"
      template  'config_tt/environments/production.rb', 'config/environments/vagrant.rb'
      gsub_file 'config/environments/vagrant.rb', "#{app_dashed_name}.com", "#{app_dashed_name}.dev"
      template  'config_tt/environments/test.rb', 'config/environments/test.rb'
    end

    def configure_initializers
      if options.api?
        copy_file 'config_tt/initializers/ext_rails.rb', 'config/initializers/ext_rails.rb'
        copy_file 'config_tt/initializers/notified.rb', 'config/initializers/notified.rb'
        copy_file 'config_tt/initializers/strong_migrations.rb', 'config/initializers/strong_migrations.rb'
      else
        directory 'config_tt/initializers', 'config/initializers'
      end
    end

    def configure_locales
      copy_file 'config_tt/locales/en.yml', 'config/locales/en.yml'
      other_locales_each do |locale|
        duplicate_locale locale
      end
    end

    def configure_sunzi
      run 'bundle exec sun create'
    end

    def configure_application
      template 'config_tt/application.rb', 'config/application.rb'
    end

    def configure_boot
      copy_file 'config_tt/boot.rb', 'config/boot.rb'
    end

    def configure_database_yml
      template 'config_tt/databases/postgresql.yml', 'config/database.yml'
    end

    def configure_routes
      template 'config_tt/routes.rb', 'config/routes.rb'
    end

    def configure_schedule
      template 'config_tt/schedule.rb', 'config/schedule.rb'
    end

    def configure_secrets_yml
      template 'config_tt/secrets.yml', 'config/secrets.example.yml'
      template 'config_tt/secrets.yml', 'config/secrets.yml'
    end

    def configure_settings_yml
      template 'config_tt/settings.yml', 'config/settings.yml'
    end

    def configure_migrate
      copy_file 'db_tt/migrate/001_devise_create_users.rb', "db/migrate/#{next_timestamp}_devise_create_users.rb"
    end

    def configure_tasks
      directory   'lib_tt', 'lib'
      remove_file 'lib/tasks/.keep'
    end

    def configure_spec
      invoke   'rspec:install'
      template 'spec_tt/rails_helper.rb', 'spec/rails_helper.rb'

      run "bundle binstubs rspec-core"
      insert_into_file 'bin/rspec', "\nrequire 'bootscale/setup'\n", after: "require 'bundler/setup'"
    end
  end
end
