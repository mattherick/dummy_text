# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dummy_text/version"

Gem::Specification.new do |s|
  s.name        = "dummy_text"
  s.version     = DummyText::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matthias Frick"]
  s.email       = ["matthias@frick-web.at"]
  s.homepage    = "https://github.com/mattherick/dummy_text"
  s.summary     = %q{Create easy a lorem ipsum dummy text}
  s.description = %q{You can easy create dummy text with lorem ipsum content}

  s.rubyforge_project = "dummy_text"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
