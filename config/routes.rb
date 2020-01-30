Rails.application.routes.draw do
  root to: "homes#index"
  resources :users, only:[:index]
end
