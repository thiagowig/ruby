Rails.application.routes.draw do
  root "home#index"

  resources :pets

  get "signup", to: "users#new"
  get "account", to: "users#edit"
  resources :users, except: [:new, :show]

  get "about", to: "about#index"
  get "dashboard", to: "dashboard#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"
end
