# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'icoveralls/version'

Gem::Specification.new do |spec|
  spec.name          = "icoveralls"
  spec.version       = Icoveralls::VERSION
  spec.authors       = ["YaGeek"]
  spec.email         = ["yannick.heinrich@gmail.com"]
  spec.description   = %q{a converalls.io tool for object-c and xcode programs}
  spec.summary       = %q{a converalls.io tool for object-c and xcode programs}
  spec.homepage      = "http://github.com/YaGeek/coveralls-objc"
  spec.license       = "MIT"
  spec.date          = "2013-10-02"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.6.7"
  spec.add_dependency "multi_json" , "~> 1.7.6"
  spec.add_dependency "thor" , "~> 0.18.1"
  spec.add_dependency "xcodeproj", "~> 0.11.1"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

end
