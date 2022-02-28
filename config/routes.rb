Rails.application.routes.draw do
  root 'categories#index'
  resources :categories do
    resources :tasks
  end

  post 'categories/:id/tasks/add', to: 'tasks#add'
  post 'categories/:id/tasks/update', to: 'tasks#update'
end
