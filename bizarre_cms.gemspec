$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bizarre_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bizarre_cms"
  s.version     = BizarreCms::VERSION
  s.authors     = ["corlinus"]
  s.email       = ["corlinus@gmail.com"]
  s.homepage    = "https://github.com/corlinus/bizarre_cms"
  s.summary     = "Filexible cms for rails"
  s.description = "Filexible cms for rails"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "jquery-rails"
  s.add_dependency 'coffee-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency "haml-rails", ">= 0.3.4"
  s.add_dependency 'activeadmin'
  s.add_dependency 'rich'
  s.add_dependency 'awesome_nested_set'
  s.add_dependency "coffee-filter"
  s.add_dependency "paperclip", "~> 3.0"
  s.add_dependency "redcarpet"

  s.add_development_dependency "rspec-rails", ">= 2.11.0"
end
