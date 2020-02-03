Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :users, only:[:index, :show, :new, :post]
  resources :products, only:[:show]

  resources "users",only: :logout, path: '' do
    collection do
      get 'logout'
    end
  end
end
