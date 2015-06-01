Rails.application.routes.draw do
  root to: "home#home"

  resources :users, except: [:index]

  resources :groups

  resources :movies

  namespace :user do
    resources :groups, only: [:index]
    resources :movies, only: [:index]
  end

  namespace :user_movies do
    resources :ratings, only: [:edit, :update]
  end

  get "login", to: "sessions#new"

  get "auth/:provider/callback", to: "sessions#create"
end
