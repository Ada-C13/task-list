Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb 'path', to: 'controller#action', as: 'nickname'
  get '/tasks', to: 'tasks#index', as: 'tasks' # lists all tasks
  get '/tasks/new', to: 'tasks#new', as: 'new_task'  # Shows a form for user to add a task (just presents to user)
  post '/tasks', to: 'tasks#create' # No nickname needed bc of same path
  
  # Routes that deal with a specific Task
  get '/tasks/:id', to: 'tasks#show', as: 'task' # Shows details for a task
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' # Brings up form to edit task
  patch '/tasks/:id', to: 'tasks#update' # Update an existing task
  delete '/tasks/:id', to: 'tasks#destroy' # Destroys a given task
end
