Rails.application.routes.draw do
  resources :card, only: [:index]
  get 'card/new'
  get 'card/show'
  devise_for :users
  root to: "homes#index"
  resources :users, only:[:index, :show, :new, :detroy]
  resources :products, only:[:show]
  resources :confirmations, only: :index

  resources "users",only: :logout, path: '' do
    collection do
      get 'logout'
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
