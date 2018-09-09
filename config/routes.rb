Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :destroy, :update, :edit]
  resources :courses, only: [:show]
  resources :courses_users, only: [:create, :destroy]
  
  get'users/:id/edit1',to: 'users#edit1'
  get'users/:id/edit2',to: 'users#edit2'
  
end
