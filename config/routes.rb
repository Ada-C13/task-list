Rails.application.routes.draw do
  # # Routes that operate on collection
  # get '/tasks', to: 'tasks#index', as: 'tasks'
  # get '/tasks/new', to: 'tasks#new', as: 'new_task'
  # post '/tasks', to: 'tasks#create'

  # # Routes that operate on individual tasks
  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  # get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  # patch '/tasks/:id', to: 'tasks#update'
  # delete '/tasks/:id', to: 'tasks#destroy'
  
  resources :tasks

  patch '/tasks/:id/mark_completed', to: 'tasks#mark_completed', as: 'mark_completed'

  root to: "tasks#index"
end