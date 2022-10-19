Rails.application.routes.draw do
  devise_for :users
  resources :pets
  resources :users, only: :show
  root to: "pets#index"
end
