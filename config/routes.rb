Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  get '/tasks', to: 'tasks#index', as: 'tasks' # lists/gets all tasks
  get '/tasks/new', to: 'tasks#new', as: 'new_task' # Gets form for a new Book
  post '/tasks', to: 'tasks#create' # Create a task

  # Routes that deal with a specific Task
  get '/tasks/:id', to: 'tasks#show', as: 'task' # Shows details for 1 task
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' # Brings the form to edit a single task
  patch '/tasks/:id', to: 'tasks#update' # Once the form is filled, it lets you update an existing task
  delete '/tasks/:id', to: 'tasks#destroy' # Destroy a given task

  # patch '/books/:id/completed_at', to: 'books#completed_at', as: 'completed_task'
  
end
