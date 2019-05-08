Rails.application.routes.draw do

  root "welcome#home"

  get "/users/new", to: "users#new", as: :signup

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:create]

  resources :bicycles, only: [:new, :create, :index]

end
