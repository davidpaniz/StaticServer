Gem::Specification.new do |s|
  s.name        = 'static_server'
  s.version     = '0.0.1'
  s.date        = '2011-05-26'
  s.summary     = "A simple way to provide static files using rack"
  s.description = "A simple way to provide static files using rack"
  s.authors     = ["David Paniz"]
  s.email       = 'contato@davidpaniz.com'
  
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.homepage    =
    'http://github.com/davidpaniz/StaticServer'
end

