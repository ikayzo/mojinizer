# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ikayzo/moji_plus_romajinizer/version'

Gem::Specification.new do |spec|
  spec.name          = "ikayzo-moji_plus_romajinizer"
  spec.version       = Ikayzo::MojiPlusRomajinizer::VERSION
  spec.authors       = ["Ikayzo"]
  spec.email         = ["ckobayashi@ikayzo.com"]
  spec.description   = %q{Combines the functionality of the Moji and Romajinizer gems. And adds useful detection and conversion methods to the String class. For more information visit https://github.com/ikayzo/ikayzo-moji_plus_romajinizer}
  spec.summary       = %q{A gem for converting between hiragana, katakana, and romaji. Supports zenkaku to hankaku, and vice versa as well.}
  spec.homepage      = "https://github.com/ikayzo/ikayzo-moji_plus_romajinizer"
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
