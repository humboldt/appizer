# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'appizer/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = ">= #{Appizer::RUBY_VERSION}"

  spec.name          = "appizer"
  spec.version       = Appizer::VERSION
  spec.authors       = ["Patrice Lebel"]
  spec.email         = ["git@patleb.com"]

  spec.summary       = "Project Boilerplate Builder"
  spec.description   = "Project Boilerplate Builder"
  spec.homepage      = "https://github.com/PatLeb/appizer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["appizer"]
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', "~> #{Appizer::RAILS_VERSION}", ">= #{Appizer::RAILS_VERSION}.0"

  spec.add_runtime_dependency 'bundler', '~> 1.3'

  spec.add_development_dependency "rake", "~> 10.0"
end
