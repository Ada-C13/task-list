Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/tasks' => 'tasks#index', as: "tasks"
  get '/tasks/new' => 'tasks#new', as: 'new_task'
  post '/tasks' => 'tasks#create'
  root to: "tasks#index"

  
  get '/tasks/:id' => 'tasks#show', as: "task"

end
