# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'mat/version'

Gem::Specification.new do |spec|
  spec.name          = "mat"
  spec.version       = Mat::VERSION
  spec.authors       = ["Peter Hellberg"]
  spec.email         = ["peter@c7.se"]
  spec.summary       = %q{A small API client for the Mat API}
  spec.homepage      = "https://github.com/peterhellberg/mat"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
