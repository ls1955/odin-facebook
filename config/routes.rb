Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: :index
  resources :strangers, only: :index
  resources :posts

  root "posts#index"
end
