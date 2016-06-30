Rails.application.routes.draw do
  devise_for :customers
  root 'home#index'
  resources :home
  resources :orders
  namespace :api do
    resources :search
    resources :orders
  end
end
