Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tasks#index'

  resources :tasks

  patch '/tasks/:id/complete', to: 'tasks#completed?', as: 'complete_task' # Mark completion of task.
end
