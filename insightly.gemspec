# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'insightly/version'

Gem::Specification.new do |spec|
  spec.name          = 'insightly'
  spec.version       = Insightly::VERSION
  spec.authors       = ['Alexander Semyonov', 'Michael Kompanets', 'David Iorns']
  spec.email         = ['al@semyonov.us', 'michael@scienceexchange.com', 'david@scienceexchange.com']
  spec.summary       = 'A Ruby wrapper for the Insightly API'
  spec.homepage      = 'https://github.com/insightly/ruby'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest_client'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'webmock', '~> 1.18.0'
end
