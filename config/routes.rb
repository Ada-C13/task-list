Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/tasks', to: 'tasks#index', as: 'tasks' # list of all tasks
  get '/tasks/new', to: 'tasks#new', as: 'new_task' # gets a form for a new task
  get '/tasks/:id', to: 'tasks#show', as: 'task' # shows details for a task
  post '/tasks', to: 'tasks#create' # create a task

end
