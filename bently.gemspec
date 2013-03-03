$:.unshift File.expand_path("../lib", __FILE__)
require "bently/version"

Gem::Specification.new do |s|
  s.name        = 'bently'
  s.version     = Bently::VERSION
  s.summary     = "Application-level dependency installation/configuration recipe manager"
  s.description = "Bently is a community maintained library of recipes for the installation and configuration of application-level dependencies"
  s.authors     = ["Benjamin Sullivan"]
  s.email       = 'ruby-bently@googlegroups.com'
  s.homepage    = 'http://github.com/bonsaiben/bently'

  s.add_dependency "thor", ">= 0.14.6"
  s.add_development_dependency "rspec", "~> 2.6"

  s.files       = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
