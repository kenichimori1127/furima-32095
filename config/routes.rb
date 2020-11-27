Rails.application.routes.draw do
  devise_for :users
  root to:'items#index'
  resources :users, only: [:new, :edit]
  resources :items, only: [:new, :create, :index, :show]
end
