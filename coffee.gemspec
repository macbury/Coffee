# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coffee/version'

Gem::Specification.new do |spec|
  spec.name          = "coffee"
  spec.version       = Coffee::VERSION
  spec.authors       = ["Arkadiusz Buras"]
  spec.email         = ["macbury@gmail.com"]
  spec.summary       = %q{Remote coffee controller for arduino powered coffee maker }
  spec.description   = %q{Remote coffee controller for arduino powered coffee maker}
  spec.homepage      = "https://github.com/macbury/Coffee"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency "thor"
  spec.add_dependency "httparty"
  spec.add_dependency "json_pure"
end
