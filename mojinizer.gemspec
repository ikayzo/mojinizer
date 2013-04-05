# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mojinizer/version'

Gem::Specification.new do |spec|
  spec.name          = "mojinizer"
  spec.version       = Mojinizer::VERSION
  spec.authors       = ["Ikayzo"]
  spec.email         = ["ckobayashi@ikayzo.com"]
  spec.description   = %q{Combines the functionality of the Moji and Romajinizer gems. And adds Japanese kana detection and conversion methods to the String class.}
  spec.summary       = %q{A gem for converting between hiragana, katakana, and romaji. This gem does not convert kanji characters.}
  spec.homepage      = "https://github.com/ikayzo/mojinizer"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "moji", "~> 1.6"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.0.4"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency "simplecov", "~> 0.7.1"
end
