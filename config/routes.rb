Rails.application.routes.draw do
    
  # Static Pages  
  root 'pages#home'

  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Users
  resources :users do
    member do
      patch :make_admin
    end
  end 

  # Password_resets
  resources :password_resets, only: [:new, :create, :edit, :update]

 
  resources :appointments
  resources :services

  # Painel Admin
  namespace :admin do 
    get 'dashboard', to: '/admin/dashboard#index'
    resources :users
    resources :services
    resources :appointments, only: [:index]  
  end

  # Painel Cliente
  namespace :customers do 
    get 'dashboard', to: 'dashboard#index'
    resources :appointments, only: [:index, :create, :edit, :update]
    resources :services, only: [:index]
    get 'services', to: 'services#index'
  end
  
end
