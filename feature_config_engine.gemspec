$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "feature_config_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "feature_config_engine"
  s.version     = FeatureConfigEngine::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of FeatureConfigEngine."
  s.description = "TODO: Description of FeatureConfigEngine."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.12"
  s.add_dependency "active_model_serializers", "~> 0.9.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "nobrainer", "~> 0.27.0"
end
