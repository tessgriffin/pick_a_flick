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

  post "/user_watchlists", to: "user_watchlists#create"
  post "/user_watchlists/update", to: "user_watchlists#update"
  post "/user_groups", to: "user_groups#create"
  put "/user_groups/update/:id", to: "user_groups#update", as: :update_user_group
  delete "/user_groups/delete/:id", to: "user_groups#destroy", as: :user_group
  get "/user_groups/pending_invitations/:id", to: "user_groups#pending", as: :pending_invitations
end
