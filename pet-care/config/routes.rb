Rails.application.routes.draw do
  root "home#index"

  resources :pets

  get "signup", to: "users#new"
  get "account", to: "users#edit"
  get "account/activate/:token", to: "users#activate_account"
  resources :users, except: [:new, :show]

  get "about", to: "about#index"
  get "dashboard", to: "dashboard#index"

  get "login", to: "sessions#login"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
end
