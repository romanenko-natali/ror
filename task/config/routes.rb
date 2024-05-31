Rails.application.routes.draw do
  get 'todos/index'
  get 'todos/show'
  get 'todos/new'
  get 'todos/create'
  get 'todos/edit'
  get 'todos/update'
  get 'todos/destroy'

  get 'projects/index'
  get 'projects/show'
  get 'projects/new'
  get 'projects/create'
  get 'projects/edit'
  get 'projects/update'
  get 'projects/destroy'

  root 'dashboard#index'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:show, :edit, :update, :new, :create]
  resources :projects do
    member do
      get 'delete', to: 'projects#destroy'
    end
  end

  resources :todos do
    member do
      get 'delete', to: 'todos#destroy'
    end
  end
end
