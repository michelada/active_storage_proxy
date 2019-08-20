$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "active_storage_proxy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "active_storage_proxy"
  spec.version     = ActiveStorageProxy::VERSION
  spec.authors     = ["Mario Chavez", "David Cuadra"]
  spec.email       = ["mario.chavez@gmail.com", "cuadraq@cuadra.com"]
  spec.homepage    = "https://github.com/michelada/active_storage_proxy"
  spec.summary     = "Rails Engine for proxying"
  spec.description = "Engine for proxying ActiveStorage blobs"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/michelada/active_storage_proxy"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.0.rc2"

  spec.add_development_dependency "sqlite3"
end
