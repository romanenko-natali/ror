Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :tasks
  end
  root 'projects#index'  # Цей рядок вказує, що кореневий маршрут має відображати список проектів
end
