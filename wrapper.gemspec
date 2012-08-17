# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'wrapper/version'

Gem::Specification.new do |s|
  s.name        = 'wrapper'
  s.version     = Wrapper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ingemar Edsborn']
  s.email       = ['ingemar@xox.se']

  s.homepage    = 'http://github.com/ingemar/wrapper'
  s.summary     = 'Wrapper is a presenter layer for Rails 3'
  s.description = 'Wrapper is a minimalistic implementation of a presenter pattern for Rails.'

  s.extra_rdoc_files = %w[README.md EXAMPLES]
  s.rdoc_options = ["--main"]

  s.files       = Dir.glob("lib/**/*") + %w[Gemfile wrapper.gemspec HISTORY README.md EXAMPLES LICENSE]
  s.test_files  = Dir.glob('spec/*')

  s.add_runtime_dependency "rails", '~> 3.0'
  s.add_development_dependency 'rspec', '~> 2.0'
end

