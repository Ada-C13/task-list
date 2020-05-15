Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "tasks#index"

  get '/tasks', to: 'task#index', as: 'tasks'

  get '/tasks/new', to: 'tasks#new', as: 'new_task'

  get '/tasks/:id', to: 'task#show', as: 'task'

  post '/tasks', to: 'task#create'

  get '/tasks/edit', to: 'tasks#edit', as: 'edit_task'

  patch '/tasks/:id', to: 'tasks#update'

  delete '/tasks/id:', to: 'task#destroy'

end
