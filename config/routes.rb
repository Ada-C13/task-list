Rails.application.routes.draw do
  
  root to: 'tasks#index'
  resources :tasks
  # ^^ replaces manually-defined restful routes below:
  # get '/tasks', to: 'tasks#index', as: 'tasks'
  # get '/tasks/new', to: 'tasks#new', as: 'new_task'
  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  # post '/tasks', to: 'tasks#create'
  # get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  # patch '/tasks/:id', to: 'tasks#update', as: 'update_task'
  # delete '/tasks/:id', to: 'tasks#destroy', as: 'destroy_task'

  post '/tasks/:id', to: 'tasks#mark_complete', as: 'mark_complete'
  post '/tasks/:id/uncomplete', to: 'tasks#mark_uncomplete', as: 'mark_uncomplete'
end