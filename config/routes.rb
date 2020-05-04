Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html

  # verb 'path' to: 'name of controller#action'
  # root to: 'tasks#index', as: 'root'
  get '/', to: 'tasks#home', as: 'root'

  # Routes that operate on the task collection:
  get '/tasks', to: 'tasks#index', as: 'tasks' # list all books
  get '/tasks/new', to: 'tasks#new', as: 'new_task' # gets a form
  post '/tasks', to: 'tasks#create' # creates a book

  # Routes that operate on individual tasks
  get '/tasks/:id', to: 'tasks#show', as: 'task' # shows details for 1 task
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' # gets a form
  patch '/tasks/:id', to: 'tasks#update' # update existing task
  delete '/tasks/:id', to: 'tasks#destroy' # destroy existing task

  # create a path here for 'mark as complete'
  # create a custom path
  patch '/tasks/:id/mark_complete', to: 'books#mark_complete', as: 'task_complete'
end
