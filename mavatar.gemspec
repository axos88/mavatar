$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mavatar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mavatar"
  s.version     = Mavatar::VERSION
  s.authors     = ["Akos Vandra"]
  s.email       = ["axos88@gmail.com"]
  s.homepage    = "http://www.akosv.com"
  s.summary     = "Gravatar fallthrough cache"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "rspec-rails"
end
