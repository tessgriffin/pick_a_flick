Rails.application.routes.draw do
  root to: "home#home"

  get "/search", to: "home#search"

  resources :users, except: [:index]

  resources :groups, only: [:new, :create, :show]

  resources :group_watchlists, only: [:create, :destroy]

  resources :movies, only: [:show]


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


  post "/votes/upvote/:id", to: "votes#upvote", as: :votes_upvote
  post "/votes/downvote/:id", to: "votes#downvote", as: :votes_downvote
end
