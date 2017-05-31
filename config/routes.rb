Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  resources :proposals, only: [:index]

  root 'proposals#index'
end
