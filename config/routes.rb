Rails.application.routes.draw do
  root "proposals#index"
  
  resources :proposals, except: :delete do
    resources :experiments, except: [:delete, :index]
  end

  resources :users, only: [:new, :create]

end
