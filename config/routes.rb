Rails.application.routes.draw do
  
  get 'shelves/new'
  get 'shelves/create'
  get 'shelves/edit'
  get 'shelves/update'
  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show, :new, :create, :edit, :update] 
  resources :reviews, only: [:new,  :create, :show, :edit, :update]
  
  resources :users
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#logout"
  root 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
