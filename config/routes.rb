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

  get  "/user_watchlists", to: "user_watchlists#index"
  post "/user_watchlists", to: "user_watchlists#create"
  post "/user_watchlists/update", to: "user_watchlists#update"
  delete "/user_watchlists/:id", to: "user_watchlists#destroy", as: :user_watchlist

  get "/user_groups", to: "user_groups#index"
  post "/user_groups", to: "user_groups#create"
  put "/user_groups/update/:id", to: "user_groups#update", as: :update_user_group
  delete "/user_groups/delete/:id", to: "user_groups#destroy", as: :user_group

  get "/user_groups/pending_invitations/:id", to: "user_groups#pending", as: :pending_invitations

  post "/votes/upvote/:id", to: "votes#upvote", as: :votes_upvote 
  post "/votes/downvote/:id", to: "votes#downvote", as: :votes_downvote 
end
