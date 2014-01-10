# encoding: utf-8
require File.expand_path('../lib/wordpress_api/version', __FILE__)

Gem::Specification.new do |gem|

  gem.authors = ["Magda Sikorska"]
  gem.email = ['madzia.sikorska@gmail.com']
  gem.description = %q{Ruby wrapper for the Wordpress API}
  gem.homepage = 'http://github.com/elrosa/wordpress_api'
  gem.name = 'wordpress_api'
  gem.summary = gem.description
  gem.version = WordpressApi::VERSION::STRING

  gem.files = `git ls-files`.split("\n")
  gem.require_paths = ['lib']
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.add_dependency 'hashie', '>= 1.2'
  gem.add_dependency 'omniauth-oauth2', '>= 1.1'

  gem.add_development_dependency 'json', '~> 1.6'
  gem.add_development_dependency 'rspec', '~> 2.6'
  gem.add_development_dependency 'webmock', '~> 1.7'

end
