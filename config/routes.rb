Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tasks#index' # set the index page to be the homepage instead of "Welcome to Rails" splash page
  
  # Routes that operate on the list of tasks
  get '/tasks', to: 'tasks#index', as: 'tasks' # list of all tasks
  get '/tasks/new', to: 'tasks#new', as: 'new_task' # gets a form for a new task
  post '/tasks', to: 'tasks#create' # create a task
  
  # Routes that operate on particular task
  get '/tasks/:id', to: 'tasks#show', as: 'task' # shows details for a task
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' # brings up the form to edit a task
  patch '/tasks/:id', to: 'tasks#update' # update the task based on given id
  delete '/tasks/:id', to: 'tasks#delete' # delete an existing task
  patch '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'task_complete'

end
