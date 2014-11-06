# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kitten_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "kitten_finder"
  spec.version       = KittenFinder::VERSION
  spec.authors       = ["Dimitar Bonev"]
  spec.email         = ["dsbonev@gmail.com"]
  spec.summary       = %q{Finds the location of the abducted kittens.}
  spec.description   = %q{Finds the location of the abducted kittens with the help of forensic data.}
  spec.homepage      = "http://which-technical-exercise.herokuapp.com/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
