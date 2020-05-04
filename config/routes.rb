Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html

  # verb 'path' to: 'name of controller#action'
  get '/', to: 'tasks#home', as: 'root'
  get '/tasks', to: 'tasks#index', as: 'tasks' # list all tasks
  get '/tasks/new', to: 'tasks#new', as: 'new_task' # gets a form
  post '/tasks', to: 'tasks#create', as: 'create_task' # creates a task
  get '/tasks/:id', to: 'tasks#show', as: 'task' # shows details for 1 task
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' # gets a form
  patch '/tasks/:id', to: 'tasks#update' # update existing task

  put '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'mark_complete_task'# marks a task complete

  delete '/tasks/:id', to: 'tasks#destroy', as: 'delete_task' # destroy existing task

end
