Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/tasks', to: 'tasks#index'
  root :to => 'tasks#index' # adding root will redirect to index without using /tasks
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  
end
