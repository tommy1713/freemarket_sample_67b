Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :users, only:[:index, :show, :new, :detroy]
  resources :products, only:[:show, :new]
  resources :confirmations, only: :index

  resources "users",only: :logout, path: '' do
    collection do
      get 'logout'
    end
  end

  resources :card, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#destoroy'
    end
  end
end
