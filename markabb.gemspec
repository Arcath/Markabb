# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "markabb/version"

Gem::Specification.new do |s|
  s.name        = "markabb"
  s.version     = Markabb::VERSION
  s.authors     = ["Adam \"Arcath\" Laycock"]
  s.email       = ["gems@arcath.net"]
  s.homepage    = "http://markabb.arcath.net"
  s.summary     = %q{Provides BBCode for Ruby and Rails}
  s.description = %q{Provides BBCode for Ruby and Rails}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "yard"
  
  s.add_runtime_dependency "coderay"
end
