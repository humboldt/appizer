module Appizer
  class AppBuilder < Rails::AppBuilder
    def readme
      template 'README.md'
    end

    def gitignore
      template '.gitignore'
    end

    def app
      empty_directory 'app'

      inside 'app' do
        directory 'assets'
        keep_file 'assets/images'
        directory 'controllers'
        keep_file 'controllers/concerns'
        template  'helpers/application_helper.rb'
        directory 'mailers'
        directory 'models'
        keep_file 'models/concerns'
        empty_directory 'views'

        inside 'views' do
          directory 'cms'
          directory 'layouts'
        end
      end
    end

    def config
      empty_directory 'config'

      inside 'config' do
        directory 'Backup'
        directory 'deploy'
        directory 'environments'
        inside    'environments' do
          configure_development
          configure_production
          template 'production.rb', 'staging.rb'
          template 'production.rb', 'vagrant.rb'
          configure_staging
          configure_vagrant
        end
        directory 'initializers'
        directory 'initializers_tt', 'initializers'
        directory 'locales'
        inside    'locales' do
          other_locales_each do |locale|
            duplicate_locale locale
            duplicate_locale locale, 'routes'
            gsub_file "routes.#{locale}.yml", /page: page/, "page: #{locale}/page"
            gsub_file "routes.#{locale}.yml", /contact: contact/, "contact: #{locale}/contact"
            duplicate_locale locale, 'simple_form'
          end
        end
        directory 'sunzi'
        template  'application.rb'
        configure_application
        template  'database.yml'
        template  'deploy.rb'
        template  'environment.rb'
        copy_file 'monitrc.erb'
        copy_file 'nginx.app.conf.erb'
        copy_file 'nginx.conf.erb'
        template  'routes.rb'
        copy_file 'schedule.rb'
        template  'secrets.yml'
      end
    end

    def database_yml
    end

    def db
    end

    def lib
      directory 'lib'
      empty_directory_with_keep_file 'lib/assets'
    end

    def public_directory
      directory 'public'
    end

    def vendor
      directory 'vendor/assets'
    end

    def leftovers
      template '.ruby-version'
      copy_file 'Capfile'
      copy_file 'Guardfile'
      template  'Vagrantfile'

      after_bundle do
        db_directory

        rake 'db:drop' if options.drop?
        rake 'db:create'
        configure_devise
        rake 'db:migrate'
        rake 'db:seed'
        rake 'db:data:dump'

        unless options.skip_git?
          git :init
          git add: '.'
          git commit: "-m 'first commit'"
          git checkout: "-b 'staging'"
          git checkout: "-b 'vagrant'"
          git checkout: "-b 'develop'"
          git config: "http.sslVerify '#{options.git_ssl_verify}'"
        end
      end
    end

    private

    def db_directory
      copy_file 'db/seeds.rb'
      rake 'railties:install:migrations'
      copy_file 'db/migrate/001_add_mail_interceptors_to_settings.rb',
        "db/migrate/#{next_timestamp}_add_mail_interceptors_to_settings.rb"
      copy_file 'db/migrate/002_devise_create_users.rb',
        "db/migrate/#{next_timestamp}_devise_create_users.rb"
    end

    def next_timestamp
      return @next_timestamp + 1 if @next_timestamp

      Dir['db/migrate/*.rb'].sort.last =~ /(\d{14})_/
      @next_timestamp = $1.to_i + 1
    end

    def configure_application
      insert_into_file 'application.rb', %{require "sprockets-derailleur"\n}, after: %{require "sprockets/railtie"\n}

      application <<-APP.strip_heredoc.indent(4)

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

        config.i18n.default_locale = :#{options.locales.first}
        config.i18n.available_locales = #{options.locales.map(&:to_sym)}

        # config.active_job.queue_adapter = :que
        config.active_record.schema_format = :sql

        config.action_view.embed_authenticity_token_in_remote_forms = true

        config.assets.paths << Rails.root.join("app", "assets", "fonts")
        config.assets.paths << Rails.root.join("vendor", "assets", "fonts")
        config.assets.precompile += %w( .svg .eot .woff .ttf)
      APP
    end

    def configure_development
      insert_into_file 'development.rb', %{require_relative '../../lib/middleware/turbo_dev'\n\n},
        before: %{Rails.application.configure do}

      environment(<<-DEV.strip_heredoc.indent(2), env: 'development')

        config.middleware.insert 0, Middleware::TurboDev
        config.middleware.insert_after(ActionDispatch::Static, Rack::LiveReload) # guard -P livereload

        config.action_controller.asset_host = 'http://localhost:3000'
        config.action_mailer.asset_host = 'http://localhost:3000'
        config.action_mailer.delivery_method = :letter_opener_web
        config.action_mailer.default_url_options = { :host => "localhost:3000" }
      DEV

      gsub_file 'development.rb', 'config.assets.debug = true', 'config.assets.debug = false'
      gsub_file 'development.rb', 'config.assets.digest = true', 'config.assets.digest = false'
    end

    def configure_production
      configure_env 'production', 'error'
      gsub_file 'production.rb', 'config.assets.js_compressor = :uglifier',
        'config.assets.js_compressor = Uglifier.new(copyright: false)'
    end

    def configure_staging
      configure_env 'staging', 'info'
    end

    def configure_vagrant
      configure_env 'vagrant', 'info'
    end

    def configure_env(name, level)
      environment(<<-CONFIG.strip_heredoc.indent(2), env: name)

        hostname = todo.todo
        config.action_controller.asset_host = "http://\#{hostname}"
        config.action_mailer.asset_host = "http://\#{hostname}"
        config.action_mailer.delivery_method = :smtp
        config.action_mailer.smtp_settings = {
          address:              'smtp.mandrillapp.com',
          port:                 587,
          domain:               hostname,
          user_name:            'todo',
          password:             'todo',
          authentication:       'plain',
          enable_starttls_auto: true,
        }
        config.action_mailer.default_url_options = { :host => hostname }
      CONFIG
      gsub_file "#{name}.rb", /# config.action_dispatch.+NGINX/,
        "config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX"
      gsub_file "#{name}.rb", 'config.log_level = :debug',
        "config.log_level = :#{level}"
    end

    def configure_devise
      invoke('devise:install')

      { '# config.http_authenticatable = false'       => 'config.http_authenticatable = true',
        'config.stretches = Rails.env.test? ? 1 : 10' => 'config.stretches = 20',
        /# config.pepper = '.+'/                      => 'config.pepper = Rails.configuration.secret_token',
        '# config.encryptor = :sha512'                => 'config.encryptor = :authlogic_sha512',
        'config.sign_out_via = :delete'               => 'config.sign_out_via = :get'
      }.each do |old, new|
        gsub_file 'config/initializers/devise.rb', old, new
      end

      copy_file 'config/locales/devise.en.yml'
      other_locales_each do |locale|
        duplicate_locale locale, 'devise'
      end
    end

    def duplicate_locale(locale, name = nil)
      src_name = name ? "#{name}.en.yml" : "en.yml"
      dst_name = name ? "#{name}.#{locale}.yml" : "#{locale}.yml"
      copy_file src_name, dst_name
      gsub_file dst_name, /^en/, locale
    end

    def other_locales_each
      options.locales.reject{ |l| l == 'en' }.each do |locale|
        yield locale
      end
    end
  end
end
