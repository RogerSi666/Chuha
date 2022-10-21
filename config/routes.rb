Rails.application.routes.draw do
  devise_for :users
  resources :pets
  resources :posts do
    resources :comments, only: :create
  end
  resources :users, only: :show
  root to: "pets#index"
end
