Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/tasks' => 'tasks#index', as: "tasks"
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'

  
  get '/tasks/:id' => 'tasks#show', as: "task"
  root to: "tasks#index"
end
