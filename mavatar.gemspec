$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mavatar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mavatar"
  s.version     = Mavatar::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Mavatar."
  s.description = "TODO: Description of Mavatar."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "rspec-rails"
end
