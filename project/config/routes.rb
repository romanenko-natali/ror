Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update]
  resources :projects do
    resources :tasks, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'dashboard#index'
end
