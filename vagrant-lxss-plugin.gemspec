# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-lxss-plugin/version'

Gem::Specification.new do |spec|
  spec.name        = "vagrant-lxss-plugin"
  spec.version     = VagrantLxss::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ["Connor Spencer Harries"]
  spec.email       = ["connorsharries96@gmail.com"]
  spec.license     = "MIT"
  spec.homepage    = "https://github.com/csh/vagrant-lxss-plugin"
  spec.summary     = "Vagrant plugin to allow VM ssh using Bash on Ubuntu on Windows"
  spec.description = "Vagrant plugin to allow VM ssh using Bash on Ubuntu on Windows"

  spec.required_ruby_version = ">= 2.1.0"
  spec.required_rubygems_version = ">= 1.4.0"

  spec.files        = `git ls-files`.split("\n")
  spec.require_path = 'lib'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
