Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb 'path', to: 'controller#aciton'
  root to: "tasks#index"  # root_path

  # collection
  get '/tasks', to: 'tasks#index', as: 'tasks'

  get '/tasks/new', to: 'tasks#new', as: 'new_task'
  post '/tasks', to: 'tasks#create' 


  # individual
  get '/tasks/:id', to: 'tasks#show', as: 'task'

  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update'

  delete '/tasks/:id', to: 'tasks#destroy'

end
