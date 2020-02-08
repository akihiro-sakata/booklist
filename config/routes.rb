Rails.application.routes.draw do

  root to: 'books#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  resources :books
  resources :users, only: [:show, :new, :create, :destroy] do
    member do
      get :likes
    end
  end
  
  
  resources :marks, only: [:create, :destroy]
  
end
