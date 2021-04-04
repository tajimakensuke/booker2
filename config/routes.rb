Rails.application.routes.draw do
  root to: 'homes#index'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resource :home, only: [:index] do
    resources :about, only: [:index]
  end
end
