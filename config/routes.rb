Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "restaurants#index"
  resources :restaurants, :dishes
end
