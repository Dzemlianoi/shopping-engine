# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'categories#default'
  resources :categories do
    get 'default', on: :member
    resources :books, only: :index
  end
  resources :books do
    resources :reviews, only: :create
  end
  resources :addresses

  mount ShoppingEngine::Engine => '/shopping_engine'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
