Rails.application.routes.draw do
  root 'stores#index'

  resources :stores, only: :index
  resources :importations, only: :create
end
