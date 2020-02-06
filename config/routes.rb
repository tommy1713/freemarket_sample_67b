Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :users, only:[:index, :show, :new, :destroy]
  resources :products, only:[:show, new]
  resources :confirmations, only: :index
  resources :sign_up do
      collection do
        get 'step1'
        get 'step2'
        get 'done'
      end
    end
  end
  resources "users",only: :logout, path: '' do
    collection do
      get 'logout'
    end
  end
  resources :card, only: [:index]
  resources :card, only: [:new, :show, :destroy] do
    collection do
      get 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
    end
  end
end
