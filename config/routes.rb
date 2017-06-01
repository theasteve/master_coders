Rails.application.routes.draw do
  get 'observations/new'

  get 'observations/create'

  get 'observations/edit'

  get 'observations/update'

  get 'observations/destroy'

  get 'observations/show'


  root "proposals#index"

  resources :proposals, except: :delete do
<<<<<<< HEAD
    resources :experiments, except: [:delete, :index] do
    end
=======
    resources :experiments, except: [:delete, :index]
>>>>>>> d0a8a09ff92c5e911b047fef7ffbd0e9797b319b
  end

  resources :users, only: [:new, :create]

  get '/users/login' => "users#login"
  post '/users/login' => "users#loggingin"
  get '/users/logout' => "users#logout"

end
