Rails.application.routes.draw do
  resources :projects do
      resources :tasks
  end
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check

  root "projects#index"
end
