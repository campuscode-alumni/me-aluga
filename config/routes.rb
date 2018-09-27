Rails.application.routes.draw do
  devise_for :users
  root to: 'properties#new'
  resources :properties, only: [:show, :new, :create]
  resources :property_types, only: [:show, :new, :create]
  resources :regions, only: [:show, :new, :create]
end
