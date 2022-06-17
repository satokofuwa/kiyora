Rails.application.routes.draw do
  root 'homes#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    delete '/users/sign_out',to: 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end
  get 'tasks/search'
  get 'tasks/sales'
  get 'tasks/task_search'
  delete 'agent/:id', to: 'agent#destroy'
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
