source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'nicer', path: '/home/plebel/Desktop/patleb/nicer'

# rails
gem 'rails', '~> 5.0'
gem 'rails-i18n'
gem 'record_tag_helper'

# ruby
gem 'recursive-open-struct'
gem 'andand'
gem 'bootscale', require: false

# security
gem 'breach-mitigation-rails'
gem 'safe_cookies'
# TODO gem 'secure_headers'
# TODO gem 'rack-attack'
gem 'devise', github: 'patleb/devise'
gem 'orm_adapter', github: 'patleb/orm_adapter'
gem 'devise-encryptable'
gem 'devise-i18n'
gem 'scatter_swap', github: 'altabyte/scatter_swap'

# database (use other schema for old data)
gem 'pg'
gem 'surus'
gem 'yaml_db', github: 'patleb/yaml_db'
# gem 'goldiloader'
# gem 'paranoia'
# gem 'ransack'
# gem 'textacular'
# gem 'ar-octopus'
gem 'paper_trail'
gem 'paper_trail-globalid'

# models
gem 'active_type', github: 'patleb/active_type'
gem 'has_defaults'
gem 'assignable_values'
gem 'email_validator' # TODO override to know when an email is invalid to make sure there is customer lost
gem 'kaminari', github: 'amatsuda/kaminari'
gem 'kaminari-i18n'
gem 'consul', github: 'gtaschuk/consul', branch: 'before_action'
gem 'acts_as_tenant', github: 'patleb/acts_as_tenant'

# files
gem 'shrine'
gem 'remotipart', github: 'pedantix/remotipart'
gem 'image_processing'
gem 'mini_magick'

# assets
gem 'sassc-rails' #, github: 'schneems/sassc-rails', branch: 'schneems/sprockets4'
gem 'sprockets', '~> 3.6.3' #, github: 'rails/sprockets', branch: 'master'
gem 'faster_path'
gem 'sprockets-derailleur', github: 'patleb/sprockets-derailleur'
gem 'uglifier'
gem 'bower-rails'
gem 'coffee-rails'

# javascript (see Bowerfile for dependencies)
gem 'jquery-rails'
# gem 'local_time'
gem 'turbolinks', '~> 5.x'
gem 'unpoly-rails', github: 'patleb/unpoly'
gem 'opal-rails', github: 'opal/opal-rails'
gem 'opal-browser', github: 'opal/opal-browser'

# css (see Bowerfile for dependencies)
gem 'autoprefixer-rails'
gem 'material_icons'
gem 'surface-rb', path: '/home/plebel/Desktop/patleb/surface-rb'

# views
gem 'nestive'
gem 'country_select'
gem 'i18n_country_select'
gem 'active_link_to'
gem 'youtube_addy'
gem 'invisible_captcha', '~> 0.8.0' #TODO removed in models in 0.9.0
gem 'lazyload-rails'
# gem 'cocoon'
# gem 'best_in_place', github: 'bernat/best_in_place'

# requests
gem 'route_translator', github: 'patleb/route_translator'
# gem 'friendly_id', '~> 5.1.0'
# gem 'redirector'
gem 'browser'

# third parties
gem 'gibbon', '~> 1.1'

# system
gem 'whenever', require: false
# gem 'sidekiq'
# gem 'sidekiq-unique-jobs'
# gem 'sidekiq-cron', '~> 0.4.0'
gem 'exception_notification' # TODO add app_id

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
  gem 'query_diet'

  # security
  gem 'bundler-audit', require: false
  gem 'brakeman', require: false
  gem 'rubocop', require: false

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
  gem 'capybara-screenshot'
  gem 'factory_girl_rails'
  gem 'poltergeist'
  gem 'database_cleaner'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'parallel_tests'
  gem 'simplecov', require: false
  gem 'spring-commands-rspec'
  gem 'opal-rspec-rails', github: 'tongueroo/opal-rspec-rails'
  gem 'opal-rspec', github: 'opal/opal-rspec'
end

group :staging, :vagrant do
  gem 'mail_interceptor'
end
