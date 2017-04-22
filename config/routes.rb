ShoppingEngine::Engine.routes.draw do
  resources :order_items, except: %i(show, new, edit)
  resources :coupons, only: :create
  resources :orders do
    get 'confirm', on: :member
  end
  resources :order_steps, only: %i(show update)
end
