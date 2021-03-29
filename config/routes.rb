Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :homes, only: [:index]
  resources :abouts, only: [:index]
end
