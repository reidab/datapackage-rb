lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'datapackage/version'

Gem::Specification.new do |s|
  s.name        = 'datapackage'
  s.version     = DataPackage::VERSION
  s.authors     = ['Leigh Dodds', 'pezholio', 'pikesley']
  s.email       = ['ops@theodi.org']
  s.homepage    = 'http://github.com/theodi/datapackage.rb'
  s.summary     = 'Library for working with data packages'
  s.files       = Dir['{bin,etc,lib}/**/*'] + ['LICENSE.md', 'README.md']
  s.executables << 'datapackage'
  s.license     = 'MIT'

  s.add_dependency 'json', '~> 1.8.3'
  s.add_dependency 'json-schema'
  s.add_dependency 'rest-client'
  s.add_dependency 'colorize'
  s.add_dependency 'rack', '~> 1.6.4'

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fakeweb', '~> 1.3'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'henry'
end
