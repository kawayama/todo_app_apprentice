Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks
  resources :categories
  get 'categories/:id/done', to: 'categories#done'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
