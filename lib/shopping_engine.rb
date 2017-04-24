require 'shopping_engine/engine'
require 'shopping_engine/orderable_model'
require 'shopping_engine/controller_additions'

require 'aasm'
require 'bootstrap-sass'
require 'cancancan'
require 'countries'
require 'country_select'
require 'devise'
require 'drape'
require 'font-awesome-rails'
require 'haml'
require 'jquery-rails'
require 'omniauth'
require 'omniauth-facebook'
require 'sass-rails'
require 'simple_form'
require 'wicked'

module ShoppingEngine
  mattr_accessor :address_class
  mattr_accessor :product_class
  mattr_accessor :order_item_class
  mattr_accessor :user_class
  mattr_accessor :user_table
  mattr_accessor :current_user_method

  def self.setup
    yield self
  end
end
