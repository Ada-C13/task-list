Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks

  #Leaving because of delete_path
  delete '/tasks/:id', to: 'tasks#destroy', as: 'delete'

  #Leaving because of completed_path
  get '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'completed'
  
end
