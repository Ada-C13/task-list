Rails.application.routes.draw do
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/tasks', to: 'tasks#index'
  # # Adding the root to task#index, to redirect to index without using/index"
  # root :to => 'tasks#index'
  # get '/tasks/new', to: 'tasks#new', as: 'new_task'
  # post "tasks", to: "tasks#create"

  # # ROUTS TO DEAL WITH SPECIFIC BOOK.
  # # To post the to the DB.
 
  # get "/tasks/:id", to: "tasks#show", as: "task"
  # get "/tasks/:id/edit", to: "tasks#edit", as: "edit_task" # Brings up  the form to edit a task.
  # patch "/tasks/:id", to: "tasks#update" # To update and existing task.
  # delete '/tasks/:id', to: 'tasks#destroy' #Destroy given task.

  root :to => 'tasks#index'
  resources :tasks
  patch "/tasks/:id/completed_at", to: "tasks#completed_at", as: "completed_task"

  
end
