Rails.application.routes.draw do
  resources :task_elems
  resources :projects
  root 'pages#home'
  resources :task_elems
  devise_for :users
end
