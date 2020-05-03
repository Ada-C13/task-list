Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Add routes that have to do with the collection of tasks
  # get '/tasks', to: 'tasks#index', as: 'tasks'
  # post '/tasks', to: 'tasks#create'
  # get '/tasks/new', to: 'tasks#new', as: 'new_task'
  
  
  # # Add routes that deal with a specifi book 
  # get '/tasks/:id', to: 'tasks#show', as: 'task'
  # get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  # delete '/tasks/:id', to: 'tasks#destroy'
  # patch '/tasks/:id', to: 'tasks#update', as: 'update_task'

  resources :tasks
  
  patch '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'task_complete'
  
  root 'tasks#index'
end
