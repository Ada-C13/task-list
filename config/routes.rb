Rails.application.routes.draw do
  # Routes that operate on collection
  get '/tasks', to: 'tasks#index', as: 'tasks'
  
  # Routes that operate on individual tasks
  get '/tasks/:id', to: 'tasks#show', as: 'task'
end
