Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/tasks', to: 'tasks#index', as: 'tasks' # lists all tasks
  get '/tasks/new', to: 'tasks#new', as: 'new_task' # gets a form for a new task
  post '/tasks', to: 'tasks#create'

  get '/tasks/:id', to: 'tasks#show', as: 'book' # shows details for 1 task
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' # brings up the form to edit the task
  patch 'tasks/:id', to: 'tasks#update'
  delete 'tasks/:id', to: 'tasks#destroy'
end
