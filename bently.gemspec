Gem::Specification.new do |s|
  s.name        = 'bently'
  s.version     = '0.0.1'
  s.date        = '2012-09-15'
  s.summary     = "Bently executes (bakes) predefined formulas (recipes)"
  s.description = "Bently executes (bakes) predefined formulas (recipes) for trivial stuff you do a lot"
  s.authors     = ["Benjamin Sullivan"]
  s.email       = 'bsullivan2@gmail.com'
  s.homepage    = 'http://github.com/bonsaiben/bently'

  s.add_dependency "thor", ">= 0.14.6"
  s.add_development_dependency "rspec", "~> 2.6"

  s.files       = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
