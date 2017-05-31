Rails.application.routes.draw do
  # resources :propsals, except: :delete do
    resources :experiments, except: [:delete, :index]
  # end
end
