# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wordpress/version"

Gem::Specification.new do |gem|
  gem.name        = "wordpress_api"
  gem.version     = Wordpress::VERSION
  gem.authors     = ["Magda Sikorska"]
  gem.email       = ["madzia.sikorska@gmail.com"]
  gem.homepage    = "https://github.com/elrosa/wordpress_api"
  gem.summary     = 'Ruby wrapper for new Wordpress REST API.'
  gem.description = 'Ruby wrapper for new Wordpress REST API.'

  gem.files = `git ls-files`.split("\n")
  gem.require_paths = ['lib']

  gem.add_dependency 'hashie', '~> 1.2.0'
  gem.add_dependency 'multi_json', '~> 1.0.3'
  gem.add_dependency 'oauth', '~> 0.4.5'

  gem.add_development_dependency 'rspec', '~> 2.7.0'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'webmock'
end
