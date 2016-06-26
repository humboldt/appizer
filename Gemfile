source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', github: 'rails/rails', tag: 'v5.0.0.rc2'
gem 'rake'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sassc-rails', github: 'sass/sassc-rails'
gem 'sprockets-derailleur', github: 'patleb/sprockets-derailleur'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'nprogress-rails', github: 'caarlos0/nprogress-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-bundler', '~> 1.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', '~> 2.0'
  gem 'capistrano3-nginx', '~> 2.0'
  gem 'capistrano-passenger'
  gem 'capistrano-day2day-recipes'
  # TODO: gem 'capistrano-maintenance', '~> 1.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.3.6'

  # gem 'web-console', '~> 3.0'
  gem 'xray-rails', github: 'brentd/xray-rails'
  gem 'letter_opener'
  gem 'letter_opener_web', '~> 1.2.0'

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
gem 'nestive', '~> 0.5'
# gem 'local_time'
# gem 'kaminari'
# gem 'kaminari-i18n'

# Forms
# gem 'cocoon'
# gem 'best_in_place', github: 'bernat/best_in_place'

# CSS
gem 'bootstrap-sass', '~> 3.3.4'
gem 'bootswatch-rails'
gem 'bh', '~> 1.3' # http://bootsnipp.com/

# Images
gem 'lazyload-rails', github: 'jassa/lazyload-rails'
gem 'browser', github: 'fnando/browser'

# Rails Admin
# gem 'nicer', github: 'patleb/nicer', branch: 'master'
gem 'nicer', path: '/home/plebel/Desktop/patleb/nicer'
gem 'rich', path: '/home/plebel/Desktop/patleb/rich'
gem 'rails_admin', github: 'patleb/rails_admin', branch: 'master'
gem 'rails_admin_jcrop', github: 'patleb/rails_admin_jcrop', branch: 'feature/one_crop_per_page'
# gem 'rails_admin_globalize_field', github: 'patleb/rails_admin_globalize_field', branch: 'master'
gem 'rails_admin_history_rollback', github: 'musterdenker/rails_admin_history_rollback', branch: 'rails5'
gem 'rails-i18n', github: 'svenfuchs/rails-i18n'
# gem 'globalize', github: 'globalize/globalize', branch: 'fix_type_cast_from_database'
gem 'remotipart', github: 'mshibuya/remotipart', ref: '3a6acb3'
gem 'route_translator', github: 'enriclluelles/route_translator', branch: 'feature/rails5'

# Auth
gem 'devise'
gem 'devise-encryptable'
gem 'devise-i18n'
# gem 'devise-i18n-views', github: 'patleb/devise-i18n-views'
gem 'devise-i18n-views', path: '/home/plebel/Desktop/patleb/devise-i18n-views'
