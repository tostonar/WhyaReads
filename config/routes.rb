Rails.application.routes.draw do
  
  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show, :new, :create, :edit, :update] 
  resources :reviews, only: [:new,  :create, :show, :edit, :update]
  
  resources :users
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
