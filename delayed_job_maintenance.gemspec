$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "delayed_job_maintenance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "delayed_job_maintenance"
  s.version     = DelayedJobMaintenance::VERSION
  s.authors     = ["John Naegle"]
  s.email       = ["john.naegle@gmail.com"]
  s.homepage    = "https://github.com/GoodMeasuresLLC/delayed_job_maintenance"
  s.summary     = "In conjunction with capistrano-maintenance, stop delayed jobs during maintenance"
  s.description = "In conjunction with capistrano-maintenance, stop delayed jobs during maintenance"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 3.0"
  s.add_dependency "delayed_job", "~> 4.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "delayed_job_active_record"
  s.add_development_dependency "byebug", "~> 9.0"
end
