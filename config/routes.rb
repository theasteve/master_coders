Rails.application.routes.draw do


  root "proposals#index"

  resources :proposals, except: :delete do
    resources :experiments, except: [:delete, :index] do
      resources :procedures, only: [:show, :new, :create]
    end
      resources :observations, only: [:new, :create, :show]
  end

  resources :users, only: [:new, :create]

  get '/users/login' => "users#login"
  post '/users/login' => "users#loggingin"
  get '/users/logout' => "users#logout"

end
