Rails.application.routes.draw do
  get '/tasks', to: 'tasks#index', as: 'tasks'
  get '/tasks/new', to:'tasks#new', as: 'new_tasks'
  post '/tasks', to: 'tasks#create'

  get '/task/:id', to: 'tasks#show', as: 'task'
  get '/task/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'task#update'
  delete '/tasks/:id', to: 'tasks#destroy'
end
