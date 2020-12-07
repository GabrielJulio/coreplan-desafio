Rails.application.routes.draw do
  devise_for :users
  resources :users, param: :nickname
  root 'users#index'
end
