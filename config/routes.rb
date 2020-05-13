Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  get '/tasks', to:'tasks#index', as: 'tasks'
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create'


  # routes that deal with a specific task
  get 'tasks/:id', to: 'tasks#show', as: 'task'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'
  delete '/tasks/:id', to: 'tasks#destroy'
  # This is a custom route, and in this case, the mark_completed! 
  patch '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'task_completed' 
end




 