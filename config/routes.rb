Rails.application.routes.draw do
  root to: 'tasks#index' 

  resources :tasks
  patch '/tasks/:id/completed_at', to: 'tasks#completed_at', as: 'completed_task'
  
end
