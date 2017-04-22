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

  s.add_dependency 'aasm'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'cancancan'
  s.add_dependency 'countries'
  s.add_dependency 'country_select'
  s.add_dependency 'devise'
  s.add_dependency 'draper'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'haml'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'omniauth', '~> 1.3.1'
  s.add_dependency 'omniauth-facebook'
  s.add_dependency 'rails', '~> 5.0.2'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'simple_form'
  s.add_dependency 'wicked'

  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-email'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'poltergeist'
end
