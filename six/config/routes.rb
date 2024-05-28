Rails.application.routes.draw do
  resources :tasks
  resources :projects
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check

  root "projects#index"
end
