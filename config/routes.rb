Rails.application.routes.draw do
  root "posts#index"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :users, only: :show
  resources :strangers, only: :index
  resources :friend_requests, only: %i[index create destroy] do
    member do
      post :accept
    end
  end
  resources :posts do
    member do
      patch :like
    end
  end
  resources :comments
  resource :profile
end
