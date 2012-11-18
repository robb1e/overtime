# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'overtime/version'

Gem::Specification.new do |gem|
  gem.name          = "overtime"
  gem.version       = Overtime::VERSION
  gem.authors       = ["Robbie Clutton"]
  gem.email         = ["robert.clutton@gmail.com"]
  gem.description   = %q{Run time based queries over a git repository}
  gem.summary       = %q{Run time based queries over a git repository}
  gem.homepage      = "http://github.com/robb1e/overtime"

  gem.add_dependency "grit"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
