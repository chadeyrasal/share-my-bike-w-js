Rails.application.routes.draw do

  root "welcome#home"

  get "/users/new", to: "users#new", as: :signup

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:create, :show] do
    resources :trips, only: [:index, :show]
    resources :bicycles, only: [:index, :new, :create]
  end

  resources :bicycles, only: [:index, :show]

  resources :cities, only: [:index, :show] do
    resources :neighborhoods, only: [:show]
  end

end
