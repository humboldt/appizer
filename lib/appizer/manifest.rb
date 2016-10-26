module Appizer
  module Manifest
    extend ActiveSupport::Concern

    # TODO keep version as well to be able to diff later
    def update_manifest
      File.open self.class.manifest_path, 'w' do |f|
        self.class.manifest_files.each do |gem, files|
          files.each do |file|
            f.puts Digest::MD5.file(gem_file_path(gem, file)).to_s
          end
        end
      end
    end

    def check_manifest!
      manifest = File.readlines(self.class.manifest_path).map(&:strip)
      changes = self.class.manifest_files.each_with_object([]) do |(gem, files), changes|
        files.each do |file|
          begin
            path = gem_file_path(gem, file)
            digest = Digest::MD5.file(path).to_s
          rescue Errno::ENOENT => e
            if options.api? && self.class.non_api_gems.any?{ |gem| e.message.include? gem }
              next
            else
              raise e
            end
          end
          unless manifest.include? digest
            changes << "#{gem}/#{file}"
          end
        end
      end
      raise (changes.unshift("\n") << "Have changed since last manifest update!").join("\n- ") unless changes.empty?
    end

    class_methods do
      def manifest_path
        File.join(File.dirname(__FILE__), 'manifest.txt')
      end

      def non_api_gems
        %w[
          rails_admin
          devise
          pundit
          guard-livereload
        ]
      end

      def manifest_files
        {
          railties: [
            'lib/rails/generators/rails/app/templates/gitignore',
            'lib/rails/generators/rails/app/templates/Gemfile',
            'lib/rails/generators/rails/app/templates/README.md',
            'lib/rails/generators/rails/app/templates/app/assets/javascripts/application.js.tt',
            'lib/rails/generators/rails/app/templates/app/assets/javascripts/cable.js',
            'lib/rails/generators/rails/app/templates/app/assets/stylesheets/application.css',
            'lib/rails/generators/rails/app/templates/app/views/layouts/application.html.erb.tt',
            'lib/rails/generators/rails/app/templates/app/mailers/application_mailer.rb',
            'lib/rails/generators/rails/app/templates/config/databases/postgresql.yml',
            'lib/rails/generators/rails/app/templates/config/environments/development.rb.tt',
            'lib/rails/generators/rails/app/templates/config/environments/production.rb.tt',
            'lib/rails/generators/rails/app/templates/config/application.rb',
            'lib/rails/generators/rails/app/templates/config/boot.rb',
            'lib/rails/generators/rails/app/templates/config/routes.rb',
            'lib/rails/generators/rails/app/templates/config/secrets.yml',
          ],
          rails_admin: [
            'app/assets/javascripts/rails_admin/custom/ui.coffee',
            'app/assets/stylesheets/rails_admin/custom/mixins.scss',
            'app/assets/stylesheets/rails_admin/custom/theming.scss',
            'app/assets/stylesheets/rails_admin/custom/variables.scss',
            'app/views/layouts/rails_admin/pjax.html.haml',
            'app/views/rails_admin/main/dashboard.html.haml',
            'lib/generators/rails_admin/templates/initializer.erb',
          ],
          devise: [
            'lib/generators/templates/devise.rb',
            'lib/generators/active_record/devise_generator.rb',
            'lib/generators/active_record/templates/migration.rb',
            'lib/generators/devise/devise_generator.rb',
            'lib/generators/devise/orm_helpers.rb',
          ],
          pundit: [
            'lib/generators/pundit/install/templates/application_policy.rb.tt',
            'lib/generators/pundit/install/templates/pundit.rb.tt',
          ],
          'rspec-rails': [
            'lib/generators/rspec/install/templates/spec/rails_helper.rb',
          ],
          'guard-livereload': [
            'lib/guard/livereload/templates/Guardfile',
          ],
          runnee: [
            'lib/generators/runnee/install/templates/config/Backup/models/model_example.rb',
          ],
          whenever: [
            'bin/wheneverize',
            'lib/whenever/capistrano/v3/tasks/whenever.rake',
          ],
          capistrano: [
            'lib/capistrano/templates/Capfile',
            'lib/capistrano/templates/deploy.rb.erb',
            'lib/capistrano/templates/stage.rb.erb',
          ],
          'capistrano-bundler': [
            'lib/capistrano/tasks/bundler.cap',
          ],
          'capistrano-passenger': [
            'lib/capistrano/tasks/passenger.cap',
          ],
          'capistrano-rails': [
            'lib/capistrano/tasks/assets.rake',
            'lib/capistrano/tasks/migrations.rake',
            'lib/capistrano/tasks/set_rails_env.rake',
          ],
          'capistrano-rbenv': [
            'lib/capistrano/tasks/rbenv.rake',
          ],
          capi_recipes: [
            'lib/capistrano/tasks/capi_recipes_tasks.rake',
            'lib/generators/capi_recipes/install/templates/config/monitrc.erb',
            'lib/generators/capi_recipes/install/templates/config/nginx.app.conf.erb',
            'lib/generators/capi_recipes/install/templates/config/nginx.conf.erb',
          ],
          sunzistrano: [
            'lib/templates/create/sunzi.yml',
            'lib/templates/create/recipes/sunzi.sh',
          ],
        }
      end
    end
  end
end
