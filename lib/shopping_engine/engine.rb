module ShoppingEngine
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingEngine
    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    config.before_initialize do
      config.i18n.load_path += Dir["#{config.root}/config/locales/*.yml"]
    end
  end
end
