Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # collection of tasks
  get '/tasks', to: 'tasks#index', as: 'tasks'

  # individual tasks
  get '/tasks/:id', to: 'tasks#show', as: 'task'
  
end
