Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users
  
  # Root path
  root 'projects#index'
  
  # Resourceful routes for users (handled by Devise)
  resources :users, only: [:show, :edit, :update]

  # Resourceful routes for projects and tasks
  resources :projects do
    resources :tasks
  end
end