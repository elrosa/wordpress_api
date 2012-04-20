# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wordpress/version"

Gem::Specification.new do |s|
  s.name        = "wordpress_api"
  s.version     = Wordpress::VERSION
  s.authors     = ["Magda Sikorska"]
  s.email       = ["madzia.sikorska@gmail.com"]
  s.homepage    = "https://github.com/elrosa/wordpress_api"
  s.summary     = 'Ruby wrapper for new Wordpress REST API.'
  s.description = 'Ruby wrapper for new Wordpress REST API.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  gem.add_dependency 'hashie', '~> 1.2.0'
  gem.add_dependency 'multi_json', '~> 1.0.3'

  s.add_development_dependency 'rspec', '~> 2.7.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'webmock'
end
