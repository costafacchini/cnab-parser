Rails.application.routes.draw do
  root 'stores#index'

  resources :stores, only: :index
  resources :transactions, only: :index
  resources :importations, only: [:new, :create]
end
