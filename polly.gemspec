Gem::Specification.new do |s|
  s.name        = 'polly'
  s.version     = '0.0.0'
  s.date        = '2012-09-15'
  s.summary     = "Polly repeats commands and stuff"
  s.description = "Polly repeats stuff and does you taught it so you don't have to google it again or do it yourself"
  s.authors     = ["Benjamin Sullivan"]
  s.email       = 'bsullivan2@gmail.com'
  s.homepage    = 'http://github.com/bonsaiben/polly'

  s.add_dependency "thor", ">= 0.14.6"

  s.files       = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
