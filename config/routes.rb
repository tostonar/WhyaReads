Rails.application.routes.draw do
  
  resources :authors, only: [:index, :show]
  resources :books, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reviews, only: [:new, :show, :edit, :update]
  end
  resources :users, only: [:show, :new, :edit, :update, :destroy]
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
