ShoppingEngine.setup do |config|
  config.product_class = 'Book'
  config.order_item_class = 'ShoppingCart::OrderItem'
  config.user_class = 'User'
  config.user_table = :users
  config.addresses_class = :address
  config.current_user_method = :current_user
end