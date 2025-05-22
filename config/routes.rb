Rails.application.routes.draw do
  
  namespace :customers do
    get 'dashboard/index'
  end
  namespace :admin do
    get 'dashboard/index'
  end
  resources :appointments
  resources :services
  # Static Pages  
  root 'pages#home'

  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Users
  resources :users, except: [:index] 

  # Password_resets
  resources :password_resets, only: [:new, :create, :edit, :update]

  # Dashboard
  get 'dashboard', to: 'dashboard#index'
  root 'dashboard#index'
  
end
