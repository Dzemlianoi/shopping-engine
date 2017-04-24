module ShoppingEngine
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../configs', __FILE__)

      def copy_initializer
        template 'shopping_engine.rb', 'config/initializers/shopping_engine.rb'
      end

      def add_route
        route "mount ShoppingCart::Engine, at: '/shopping_engine'"
      end
    end
  end
end