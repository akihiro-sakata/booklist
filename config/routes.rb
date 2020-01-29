Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: 'books#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :books

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :destroy]
  
  
  
end
