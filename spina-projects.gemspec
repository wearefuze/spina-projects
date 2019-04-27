$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spina/projects/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spina-projects"
  s.version     = Spina::Projects::VERSION
  s.authors     = ["Dan Mitchell"]
  s.email       = ["dan@danmitchell.co.uk"]
  s.homepage    = "http://www.danmitchell.co.uk"
  s.summary     = "Projects plugin for Spina"
  s.description = "Plugin for Spina CMS to include projects on your website"
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_runtime_dependency 'friendly_id', '~> 5.2', '>= 5.2.1'
  s.add_runtime_dependency 'spina', '>= 1.0.0'

  s.add_development_dependency 'pg'
  s.add_development_dependency 'pry-rails', '~> 0'
end
