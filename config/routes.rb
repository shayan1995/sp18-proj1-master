Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  patch "trainers/show.html.erb", to: "pokemons#damage", as: "damage"
  patch  "home/index", to: "pokemons#capture", as: "capture"
  get "pokemons/new", to: "pokemons#new", as: "new"
  resources :pokemons, only: [:new, :create, :index]
  post "pokemons/new", to: "pokemons#create"

end
