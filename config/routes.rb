Rails.application.routes.draw do

  root "welcome#home"

  get "/users/new", to: "users#new", as: :signup

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

  get "/auth/facebook/callback", to: "sessions#create"

  resources :users, only: [:create, :show] do
    resources :trips, only: [:index, :show, :edit, :update]
    resources :bicycles, only: [:index, :show, :new, :create, :edit, :update]
  end

  resources :bicycles, only: [:show] do
    resources :trips, only: [:new, :create]
  end

  resources :cities, only: [:index, :show] do
    resources :neighborhoods, only: [:index, :show]
    resources :bicycles, only: [:index]
  end

end
