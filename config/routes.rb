Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => 'tasks#index'
  get '/tasks', to: 'tasks#index', as: 'tasks'
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  ##PAIR -- get, post -- to add new
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'
  ##PAIR -- get, patch -- to update existing
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update' 
  delete '/tasks/:id', to: 'tasks#destroy', as: 'delete'

end
