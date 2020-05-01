# config/routes.rb

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Verb 'path', to: 'controller#action'
  # Add routes that deal with the entire collection of tasks
  get "/tasks", to: "tasks#index", as: "tasks"            # list all tasks
  get "/tasks/new", to: "tasks#new", as: "new_task"       # get form for new task
  post "/tasks", to: "tasks#create"                       # create a new task
  root to: "tasks#index"

  # Add routes that deal with one specific task
  get "/tasks/:id", to: "tasks#show", as: "task"          # show details for one task
  get "tasks/:id/edit", to: "tasks#edit", as: "edit_task" # get form to edit task
  patch "tasks/:id", to: "tasks#update"                   # update/edit one specific task
  delete "tasks/:id", to: "tasks#destroy"                 # destroy one specific task
  
end
