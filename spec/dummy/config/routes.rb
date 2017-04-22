Rails.application.routes.draw do
  mount ShoppingEngine::Engine => "/shopping_engine"
end
