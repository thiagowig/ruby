Rails.application.routes.draw do
  root "home#index"

  resources :pets

  resources :users

  get "about", to: "about#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"
end
