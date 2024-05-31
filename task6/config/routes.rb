Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  resources :projects do
    resources :tasks
  end
  root to: 'projects#index'
end