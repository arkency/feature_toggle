# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'arkency/feature_toggle/version'

Gem::Specification.new do |spec|
  spec.name          = "arkency-feature_toggle"
  spec.version       = Arkency::FeatureToggle::VERSION
  spec.authors       = ["Arkency"]
  spec.email         = ["dev@arkency.com"]

  spec.summary       = %q{A Simple feature toggle for a Rails app}
  spec.homepage      = "https://github.com/arkency/feature_toggle"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
