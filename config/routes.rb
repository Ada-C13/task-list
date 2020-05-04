Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  resources :tasks # defines all 7 RESTful routes
  # get '/tasks', to: 'tasks#index', as: 'tasks' # lists all tasks
  # post '/tasks', to: 'tasks#create'
  # get '/tasks/new', to: 'tasks#new', as: 'new_task' # gets a form for a new task

  # get '/tasks/:id', to: 'tasks#show', as: 'task' # shows details for 1 task
  # get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' # brings up the form to edit the task
  # patch 'tasks/:id', to: 'tasks#update' # update an existing task
  # delete 'tasks/:id', to: 'tasks#destroy' # delete a task

  patch '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'mark_complete'
end
