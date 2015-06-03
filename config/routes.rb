Rails.application.routes.draw do
  root to: "home#home"

  get "/search", to: "home#search"

  resources :users, except: [:index]

  resources :groups

  resources :group_watchlists, only: [:create]

  resources :movies


  get "auth/:provider/callback", to: "sessions#create"

  get "login",      to: "sessions#new"
  delete "/logout", to: "sessions#destroy"

  post "/user_watchlist", to: "user_watchlists#create"
end
