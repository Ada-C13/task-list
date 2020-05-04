Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'tasks#index'
  get '/tasks', to: 'tasks#index' #as: 'all_tasks'
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  get '/tasks/:id', to: 'tasks#show', as: 'task' #an alias 
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  post '/tasks', to: 'tasks#create', as: 'create_task'
  patch '/tasks/:id', to: 'tasks#update', as: 'update_task'
  patch 'tasks/:id/complete', to: 'tasks#mark_complete', as: 'mark_complete'
  delete '/tasks/:id', to: 'tasks#destroy', as: 'remove_task'
end
