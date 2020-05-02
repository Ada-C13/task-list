Rails.application.routes.draw do
  # Routes that operate on collection
  get '/tasks', to: 'tasks#index', as: 'tasks'
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'

  # Routes that operate on individual tasks
  get '/tasks/:id', to: 'tasks#show', as: 'task'

  root to: "tasks#index"
end