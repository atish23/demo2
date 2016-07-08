Rails.application.routes.draw do
  devise_for :admins
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :customers

  root 'home#index'

  resources :home

  resources :orders

  resources :users, only: [:show, :index]

  namespace :api , defaults: {format: 'json'} do

      resources :search, only: [:show]

      resources :orders
      resources :sessions, :only => [:create, :destroy]
  end

end
