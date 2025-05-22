Rails.application.routes.draw do
  
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

 
  resources :appointments
  resources :services

  # Painel Admin
  namespace :admin do 
    get 'dashboard', to: '/admin/dashboard#index'
    resources :users
    resources :services
    resources :appointments  
  end

  # Painel Cliente
  namespace :customers do 
    get 'dashboard', to: 'dashboard#index'
    resources :appointments
    get 'services', to: 'services#index'
  end
  
end
