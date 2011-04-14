# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'interceptor'

Gem::Specification.new do |s|
  s.name        = 'interceptor'
  s.version     = Interceptor::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ryan Allen']
  s.email       = ['ryan@ryanface.com']
  s.homepage    = 'https://github.com/ryan-allen/interceptor'
  s.summary     = %q{Mad Max had one, and he was freaking awesome.}
  s.description = %q{Interceptor is a library for modifying calls to objects. You can change things as they come in or as they go out.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']
end
