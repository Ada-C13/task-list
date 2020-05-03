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

  #custom routes - making a book as read 
#patch '/books/:id/mark_read', to: 'books#mark_read', as: 'book_read' #making up new extension is ok 
  ## would nn to make view with touch app/views/books/mark_read.html.erb
  ## then add path to application 

  
end
