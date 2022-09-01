require_relative "lib/mitlibraries/theme/version"

Gem::Specification.new do |spec|
  spec.name          = 'mitlibraries-theme'
  spec.version       = Mitlibraries::Theme::VERSION
  spec.authors       = ['Jeremy Prevost']
  spec.email         = ['jprevost@mit.edu']
  spec.summary       = 'General theme for MIT Libraries Rails apps'
  spec.homepage      = 'https://github.com/MITLibraries/mitlibraries-theme'
  spec.license       = 'MIT'
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/MITLibraries/mitlibraries-theme"
  spec.metadata["changelog_uri"] = "https://github.com/MITLibraries/mitlibraries-theme/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  end

  spec.add_development_dependency 'debug', '~> 1'
  spec.add_development_dependency 'simplecov', '~> 0'
  spec.add_development_dependency 'simplecov-lcov', '~> 0'
  spec.add_dependency 'rails', '>= 6', '< 8'
  spec.add_dependency 'sassc-rails', '~> 2'
end
