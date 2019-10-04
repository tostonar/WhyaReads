Rails.application.routes.draw do
  
  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show, :new, :create, :edit, :update] 
  resources :reviews
  resources :lists, only: [:new, :create, :index, :edit, :update]
  
  resources :users
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#logout"
  get '/analytics', to: "application#analytics"
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
