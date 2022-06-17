Rails.application.routes.draw do
  root 'homes#index'
  resources :users, only: %i[index new create show]
  resources :tasks do
    collection do
      get 'search'
    end
    member do
      resources :partners
    end
    member do
      resources :workers
    end
  
    member do
      resources :users
    end
  end
  resources :properties do
    collection do
      get 'search'
    end
  end
  resources :agents do
    collection do
      get 'search'
    end
  end
  resources :customers,only: %i[show]
  resources :claims
  resources :relationships, only: %i[create destroy]

end
