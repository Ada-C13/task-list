Rails.application.routes.draw do
  #ORDER MATTERS!
  #new task
  # get '/tasks/new', to: 'tasks#new', as: 'new_task'
  resources :tasks, only: [:index, :show, :create, :new, :edit, :update]
  #edit
  # get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  #get '/tasks', to: 'tasks#index', as: :task
  #get    "/tasks"          , to: "tasks#index",   as: :task
  #get '/', to: 'tasks#index'
  #show action
  #get '/tasks/:id', to: 'tasks#show'
  # post '/tasks', to: 'tasks#create'
  root 'tasks#index'
end
