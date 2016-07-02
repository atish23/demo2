Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :customers

  root 'home#index'

  resources :home

  resources :orders

  resources :users	do
  	get 'orders', on: :member
  end

  namespace :api do

      resources :search

      resources :orders
  end

end
