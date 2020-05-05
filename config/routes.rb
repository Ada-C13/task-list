Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #routes that operate on collection of tasks
  get '/tasks', to: 'tasks#index', as: 'tasks'
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create' #dont nn to make nickname bc path is the same as /book

  #Routes that deal with specific task 
  get '/tasks/:id', to: 'tasks#show', as: 'task' # shows details for one task
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' #brings up form to edit a task
  patch '/tasks/:id', to: 'tasks#update' #send the update form
  delete '/tasks/:id', to: 'tasks#destroy' #deleted task
  patch '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'mark_complete' # will mark task complete



  
end
