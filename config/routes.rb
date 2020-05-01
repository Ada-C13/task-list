Rails.application.routes.draw do
  
  #verd, path routed to controller action, give path a name (prefix) for views
  
  root :to => 'tasks#index'
  
  get '/tasks', to: 'tasks#index', as: 'tasks' # list all task
  #tasks_path ^^
  get '/tasks/new', to: 'tasks#new', as: 'new_task' #routes to post 

  post '/tasks',  to: 'tasks#create' 


  # routes that deal with specific task
  get '/tasks/:id', to: 'tasks#show', as: 'task' # shows one task

  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' #edits book

  patch '/tasks/:id', to: 'tasks#update' 

  delete '/tasks/:id', to: 'tasks#destroy'

  #patch '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'mark_complete'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
