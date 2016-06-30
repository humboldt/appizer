source 'https://rubygems.org'


gem 'nicer', path: '/home/plebel/Desktop/patleb/nicer'

# Nicer overrides
gem 'rails_admin', github: 'patleb/rails_admin', branch: 'master'
gem 'rich', github: 'patleb/rich'
gem 'rails_admin_jcrop', github: 'patleb/rails_admin_jcrop', branch: 'feature/one_crop_per_page'
gem 'rails_admin_history_rollback', github: 'patleb/rails_admin_history_rollback'
# gem 'rails_admin_globalize_field', github: 'patleb/rails_admin_globalize_field', branch: 'master'
# gem 'globalize', github: 'globalize/globalize', branch: 'fix_type_cast_from_database'
gem 'remotipart', github: 'mshibuya/remotipart', ref: '3a6acb3'
gem 'route_translator', github: 'patleb/route_translator', branch: 'feature/rails5'
gem 'active_type', github: 'patleb/active_type'
gem 'kaminari', github: 'amatsuda/kaminari', branch: '0-17-stable'
gem 'sprockets-derailleur', github: 'patleb/sprockets-derailleur'
gem 'ar-uuid', github: 'patleb/ar-uuid'
gem 'orm_adapter', github: 'patleb/orm_adapter'
gem 'acts_as_tenant', github: 'patleb/acts_as_tenant'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

group :development, :test do
  # Use Puma as the app server
  gem 'puma', '~> 3.0'

  gem 'capistrano', '~> 3.1'
  gem 'capistrano-bundler', '~> 1.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano3-nginx', '~> 2.0'
  gem 'capistrano-passenger'
  gem 'capistrano-day2day-recipes'
  # TODO: gem 'capistrano-maintenance', '~> 1.0'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'xray-rails', github: 'patleb/xray-rails'
  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.2.0'
  gem 'active_record_query_trace'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard', '>= 2.2.2', require: false
  gem 'guard-livereload',  require: false
  gem 'rack-livereload'
  gem 'rb-fsevent',        require: false
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'spring-commands-rspec'
end

group :staging, :vagrant do
  gem 'mail_interceptor'
end


# Scheduling
gem 'whenever', require: false
# gem 'que'

# Database
gem 'yaml_db', github: 'patleb/yaml_db'
# gem 'goldiloader'
# gem 'paranoia', '~> 2.0'

# Routes
# gem 'friendly_id', '~> 5.1.0'
# gem 'friendly_id-globalize', '~> 1.0.0'
# gem 'redirector'

# Search
# gem 'ransack'
# gem 'textacular', '~> 3.0'

# Views
# gem 'local_time'
# gem 'kaminari'
# gem 'kaminari-i18n'

# Forms
# gem 'cocoon'
# gem 'best_in_place', github: 'bernat/best_in_place'
