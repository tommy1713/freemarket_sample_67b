Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :users, only:[:index, :show, :new]
  resources :products, only:[:show]
  resources :users, only: :show
  resources :confirmations, only: :index
end
