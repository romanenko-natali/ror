Rails.application.routes.draw do
  get 'home/index'

  resources :tasks, only: [:index] 
  resources :dashboard, only: [:index]

  devise_for :users
  
  resources :users, only: [:show, :edit, :update]

  resources :projects do
    resources :tasks, only: [:index, :show, :new, :create]
    resources :comments, only: [:create, :edit, :update, :destroy]
    member do
      post 'invite_user'
    end
  end

  resources :tasks, only: [:edit, :update, :destroy] do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  
  root 'dashboard#index'
end
