# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'front_matter_ninja/version'

Gem::Specification.new do |spec|
  spec.name          = 'front_matter_ninja'
  spec.version       = FrontMatterNinja::VERSION
  spec.authors       = ['Nicolas McCurdy']
  spec.email         = ['thenickperson@gmail.com']

  spec.summary       = 'A library for parsing and modifying front matter.'
  spec.homepage      = 'https://github.com/nicolasmccurdy/front_matter_ninja'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem ' \
         'pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test|spec|features)\//)
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'safe_yaml', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'activesupport', '~> 4.2'
end
