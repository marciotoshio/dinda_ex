# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dinda_ex/version'

Gem::Specification.new do |spec|
  spec.name          = "dinda_ex"
  spec.version       = DindaEx::VERSION
  spec.authors       = ["Marcio Toshio Ide"]
  spec.email         = ["contato@marciotoshio.com.br"]

  spec.summary       = %q{Dinda EX.}
  spec.homepage      = "https://github.com/marciotoshio/dinda_ex"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
