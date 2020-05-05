Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #add routes taht have to do with collection of tasks
  get '/tasks', to: 'tasks#index', as: 'tasks' #list all tasks
  get 'tasks/new', to: 'tasks#new', as: 'new_task'#gets a form for a new book
  post '/tasks', to: 'tasks#create'
  
  #routes that deal with a specific book
  get '/tasks/:id', to: 'tasks#show', as: 'task' #shows details about one book
  get '/tasks/:id/edit', to: 'tasks#edit' , as: 'edit_task' #brings up the form to edit a book
  patch '/tasks/:id', to: 'tasks#update' #update an existing book
  patch '/tasks/:id/complete', to: 'tasks#complete', as: 'complete_task' #update an existing book
  delete '/tasks/:id', to: 'tasks#destroy' #destroy a given book
end
