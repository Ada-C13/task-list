Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Add route for root
  root to: 'application#index'

  #Add routes that have to do with the collection 
  get '/tasks', to: 'tasks#index', as: 'tasks' #lists all tasks
  get '/tasks/new', to: 'tasks#new', as: 'new_task' #gets form for new task
  post '/tasks', to: 'tasks#create'

  #Add routes that deal with a specific task 
  get '/tasks/:id', to: 'tasks#show', as: 'task' #shows details for one task
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' #brings up the form to edit a task
  patch '/tasks/:id', to: 'tasks#update' #makes a change to a task
  delete '/tasks/:id', to: 'tasks#destroy' #deletes a task

  patch '/tasks/:id/mark_complete', to:'tasks#mark_complete' #Marks a task complete
  patch '/tasks/:id/mark_incomplete', to:'tasks#mark_incomplete' #Marks a task complete
end
