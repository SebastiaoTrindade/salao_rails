Rails.application.routes.draw do
  
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
