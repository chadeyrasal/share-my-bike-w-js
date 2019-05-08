Rails.application.routes.draw do

  root "welcome#home"

  get "/renters/new", to: "renters#new", as: :signup

  get "/owners/new", to: "owners#new", as: :owner_signup

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  resources :renters, only: [:create]

  resources :owners, only: [:create]

end
