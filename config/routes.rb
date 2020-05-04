Rails.application.routes.draw do
  
  #verd, path routed to controller action, give path a name (prefix) for views
  
  root to: 'tasks#index'
  resources :tasks

  patch '/tasks/:id/mark_complete', to: 'tasks#mark_complete', as: 'mark_complete'

end
