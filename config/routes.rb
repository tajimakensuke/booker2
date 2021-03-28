Rails.application.routes.draw do
  devise_for :users
  root to: 'post_books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :post_books, only: [:new, :create, :index, :show, :destroy]
  resource :user, only: [:show, :edit, :update]
end
