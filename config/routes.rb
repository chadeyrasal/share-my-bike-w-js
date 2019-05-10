Rails.application.routes.draw do

  root "welcome#home"

  get "/users/new", to: "users#new", as: :signup

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:create] do
    resources :trips, only: [:index]
  end

  resources :bicycles, only: [:new, :create, :index, :show]

  resources :cities, only: [:index, :show] do
    resources :neighborhoods, only: [:show]
  end

end
