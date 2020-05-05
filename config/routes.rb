Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'

  put 'tasks/:id', to: 'tasks#mark_complete'
  resources :tasks
end
