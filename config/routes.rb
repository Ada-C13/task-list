Rails.application.routes.draw do
  
  get '/tasks', to: 'tasks#index', as: 'tasks'
  # tasks_path helper method to give you the right url
  # when you use link_to etc in the views for user to take action on

  # why 'new_task' not working in localhost3000, but new is?
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  # why as singular task below?
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  post '/tasks', to: 'tasks#create'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update', as: 'update_task'
  delete '/tasks/:id', to: 'tasks#destroy', as: 'destroy_task'
end
