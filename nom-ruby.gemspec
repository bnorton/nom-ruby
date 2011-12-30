# -*- encoding: utf-8 -*-
require File.expand_path("../lib/nom-ruby/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "nom-ruby"
  s.version     = GemNom::VERSION::STRING
  s.platform    = Gem::Platform::RUBY
  s.author     = 'Brian Norton'
  s.email       = ["team@justnom.it"]
  s.homepage    = "https://github.com/bnorton/nom-ruby"
  s.summary     = "Nom API ruby client"
  s.description = "Ruby client for using the Nom API. Nom is the best way to find out what's best in your world."
  
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "nom-ruby"

  s.add_dependency 'json', '>= 1.4.6'

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "gemcutter", ">= 0.6.1"
  s.add_development_dependency "rspec", "~> 2.2"

  s.files = `git ls-files`.split("\n") - ['.rvmrc', '.gitignore']
  s.test_files = `git ls-files`.split("\n").grep(/^spec/)
  s.require_paths = %w[lib]

  s.extra_rdoc_files = ['README.md', 'LICENSE.md', 'CHANGELOG.md']
  s.rdoc_options = ['--line-numbers', '--inline-source', '--title', 'nom-ruby', '--main', 'README.md']

end