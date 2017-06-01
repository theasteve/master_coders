Rails.application.routes.draw do
  get 'observations/new'

  get 'observations/create'

  get 'observations/edit'

  get 'observations/update'

  get 'observations/destroy'

  get 'observations/show'


  root "proposals#index"

  resources :proposals, except: :delete do
    resources :experiments, except: [:delete, :index] do
    end
  end

  resources :users, only: [:new, :create]

  get '/users/login' => "users#login"
  post '/users/login' => "users#loggingin"
  get '/users/logout' => "users#logout"

end
