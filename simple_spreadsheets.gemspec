# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_spreadsheets/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_spreadsheets"
  spec.version       = SimpleSpreadsheets::VERSION
  spec.date          = '2016-03-23'
  spec.authors       = ["Foraker Labs"]
  spec.email         = ["llc@foraker.com"]
  spec.summary       = %q{Easily render Excel-friendly spreadsheets.}
  spec.description   = %q{A gem for simply rendering xls.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "nokogiri"
end
