Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/tasks', to: 'tasks#index', as: 'tasks'

  get '/tasks/new', to: 'tasks#new', as: 'new_task' # order matters!
  # if tasks/new goes after tasks/:id, rails will use tasks/:id route!

  post '/tasks', to: 'tasks#create'

  get '/tasks/:id', to: 'tasks#show', as: 'task'

  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'

  patch '/tasks/:id', to: 'tasks#update'

  get '/tasks/:id/confirm', to: 'tasks#confirm_delete', as: 'destroy_confirm'

  # why it's not working if we add /delete after the '/tasks/:id' ?
  delete '/tasks/:id', to: 'tasks#destroy', as: 'destroy_task'

  post '/tasks/:id/complete', to: 'tasks#complete', as: 'complete_task'
  
end
