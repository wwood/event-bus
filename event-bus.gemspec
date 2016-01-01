# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event/bus/version'

Gem::Specification.new do |spec|
  spec.name          = 'event-bus'
  spec.version       = Event::Bus::VERSION
  spec.authors       = ['Dennis Günnewig']
  spec.email         = ['dg1@ratiodata.de']

  spec.summary       = 'Notify subscribers about event'
  spec.description   = 'This gem notifies subscribers about event'
  spec.homepage      = 'https://github.com/dg-ratiodata/event-bus'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
end
