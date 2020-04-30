Rails.application.routes.draw do
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html

  # verb 'path' to: 'name of controller#action'
  get '/tasks', to: 'tasks#index' #list all tasks
  get 'tasks/:id', to: 'tasks#show' #list one task by id
end
