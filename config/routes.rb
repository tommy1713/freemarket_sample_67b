Rails.application.routes.draw do
  devise_for :users
  root to: "sign_up#step1"
  resources :users, only:[:index, :show, :new]
  resources :products, only:[:show]
  resources :users, only: :show
  resources :confirmations, only: :index
  resources :sign_up do
    member do
      get 'information'
    end
  end
end
