Rails.application.routes.draw do
  
  get '/tasks', to: 'tasks#index', as: 'tasks'
  # tasks_path helper method to give you the right url
  # when you use link_to etc in the views for user to take action on

  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  post '/tasks', to: 'tasks#create'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update', as: 'update_task'
  get '/tasks/:id/destroy', to: 'tasks#destroy_confirmation', as: 'destroy_confirmation'
  # Why does delete after :id not work after the get request above?
  delete '/tasks/:id', to: 'tasks#destroy', as: 'destroy_task'
  post '/tasks/:id', to: 'tasks#mark_complete', as: 'mark_complete'
end
