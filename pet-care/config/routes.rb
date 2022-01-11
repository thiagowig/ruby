Rails.application.routes.draw do
  root "home#index"

  resources :pets

  get "signup", to: "users#new"
  resources :users, except: [:new]

  get "about", to: "about#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"
end
