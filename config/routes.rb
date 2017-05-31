Rails.application.routes.draw do
  root "proposals#index"

  resources :proposals, except: [:delete]



  resources :users, only: [:new, :create]

end
