Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/tasks', to: 'tasks#index', as: 'tasks'

  get '/tasks/new', to: 'tasks#new', as: 'new_task' # order matters!
  # if tasks/new goes after tasks/:id, rails will use tasks/:id route!

  post '/tasks', to: 'tasks#create'

  get '/tasks/:id', to: 'tasks#show', as: 'task'
  
end
