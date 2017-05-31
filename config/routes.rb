Rails.application.routes.draw do
  root "proposals#index"

  resources :proposals, except: :delete do
    resources :experiments, except: [:delete, :index]
  end

  resources :users, only: [:new, :create]

  get '/users/login' => "users#login"
  post '/users' => "users#login"
  get '/users/logout' => "users#logout"

end
