# Appizer

RAILS_ENV=production DATABASE_URL=postgresql://postgres:postgres@127.0.0.1/appizer_development bundle exec rake assets:precompile
bundle exec guard -P livereload -w ~/Desktop/patleb/appizer ~/Desktop/patleb/surface-rb

TODO: Consul
TODO: paper_trail (uuid)
TODO: translations in hstore and some RailsAdmin js tabs
TODO: make the platform work when languages are added
TODO: MenuItem viewable model
TODO: Select Themes
TODO: Sprockets 4
TODO: gem 'http_accept_language'

TODO: Delete this and describe your gem

## Installation

Install the gem:

    $ gem install appizer

To output the current gem version:

    $ appizer -v

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Vagrant

After `vagrant up`, connect with `vagrant ssh` and add your public ssh key `id_rsa.pub` to `~/.ssh/authorized_keys`.

## TODO

* Gzip yaml_db
* Moneybird i18n-workflow
* Rack-attack + Log rotate
* Rspec
* Redis + Que
*. icon or simple text for submit buttons
*. overflow: auto; on secondary-menu
*. search form authenticity_token cached, so use GET method

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/patleb/appizer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
