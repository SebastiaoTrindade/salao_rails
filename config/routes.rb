Rails.application.routes.draw do
  # Static Pages  
  root 'pages#home'

  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Users
  resources :users, except: [:index] 
  
end
