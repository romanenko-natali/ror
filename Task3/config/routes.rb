# Rails.application.routes.draw do
#   get 'tasks/new'
#   get 'tasks/create'
#   get 'tasks/index'
#   get 'tasks/show'
#   get 'tasks/edit'
#   get 'tasks/update'
#   get 'tasks/destroy'
#   get 'projects/new'
#   get 'projects/create'
#   get 'projects/index'
#   get 'projects/show'
#   get 'projects/edit'
#   get 'projects/update'
#   get 'projects/destroy'
#   get 'users/new'
#   get 'users/create'
#   get 'users/show'
#   get 'users/edit'
#   get 'users/update'
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"
# end

Rails.application.routes.draw do
  root 'dashboard#index'

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :projects do
    resources :tasks, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :task_comments, only: [:create, :destroy]
    end
    resources :project_comments, only: [:create, :destroy]
    post 'invite', on: :member
    delete 'uninvite', on: :member
  end
  
  delete 'projects/:project_id/tasks/:id', to: 'tasks#destroy', as: 'delete_project_task'

  resources :tasks, only: [:destroy] 

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
