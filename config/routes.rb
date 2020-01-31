Rails.application.routes.draw do
  root to: "homes#index"
  resources :products, only:[:show]
end
