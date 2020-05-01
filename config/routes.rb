Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Add Routes that have to with the collection of tasks
  get "tasks", to: "tasks#index", as: "tasks" #all books
  get "tasks/new", to: "tasks#new", as: "new_task" #gets a form for new
  post "/tasks", to: "tasks#create"

  #Routes that deal witha a specific Task
  get "/tasks/:id", to: "tasks#show", as: "task"
  get "tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  patch "/tasks/:id", to: "tasks#update"
  delete "/tasks/;id", to: "tasks#destory"
end
