lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mitlibraries/theme/version'

Gem::Specification.new do |spec|
  spec.name          = 'mitlibraries-theme'
  spec.version       = Mitlibraries::Theme::VERSION
  spec.authors       = ['Jeremy Prevost']
  spec.email         = ['jprevost@mit.edu']

  spec.summary       = 'General theme for MIT Libraries Rails apps'
  spec.homepage      = 'https://github.com/MITLibraries/mitlibraries-theme'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'rails', '~> 5'
  spec.add_dependency 'sass', '~> 3.4'
  spec.add_dependency 'sass-rails', '~> 5'
end
