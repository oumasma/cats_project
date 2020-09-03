Rails.application.routes.draw do

  get 'users/show'
  root 'cat_pictures#index'
  get 'pages/about_us', to: 'pages#about_us'

  devise_for :users
  resources:cat_pictures
  
  resource :user do
    resources :carts
    resources :orders, only: [:index, :show, :create, :destroy]
  end

  resources :line_cat_pictures, only: [:create, :destroy]

  resources :charges, only: [:new, :create]
end