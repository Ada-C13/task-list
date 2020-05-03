Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html

  # verb 'path' to: 'name of controller#action'
  
  get '/', to: 'tasks#home', as: 'root'

  # Routes that operate on the task collection:
  get '/tasks', to: 'tasks#index', as: 'tasks'
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'

  # Routes that operate on individual tasks
  # look into this route tasks.1
  get '/tasks/:id', to: 'tasks#show'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'
  delete '/tasks/:id', to: 'tasks#destroy'
end
