Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tasks#index'

  get '/tasks', to: 'tasks#index', as: 'tasks'
  get '/tasks/new', to: 'tasks#new', as: 'new_task' # Form for new task.
  # get '/tasks/complete', to: 'tasks#complete', as: 'complete_task'
  post '/tasks', to: 'tasks#create'

  get '/tasks/:id', to: 'tasks#show', as: 'task'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'
  patch '/tasks/:id/complete', to: 'tasks#completed?', as: 'complete_task'
  delete '/tasks/:id', to: 'tasks#destroy'
end
