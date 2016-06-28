Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    resources :search
  end
end
