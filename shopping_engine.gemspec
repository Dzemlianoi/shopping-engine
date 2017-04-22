$:.push File.expand_path('../lib', __FILE__)
require 'shopping_engine/version'

Gem::Specification.new do |s|
  s.name        = 'shopping_engine'
  s.version     = ShoppingEngine::VERSION
  s.authors     = ['Denis Zemlianoi']
  s.email       = ['dzemlianoi@gmail.com']
  s.homepage    = 'TODO'
  s.summary     = 'Summary of ShoppingEngine.'
  s.description = 'Description of ShoppingEngine.'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.0.2'

  s.add_development_dependency 'sqlite3'
end
