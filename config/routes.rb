Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  root to: "tasks#index"
  
  resources :tasks

  # custom route
  patch '/tasks/:id/mark', to: 'tasks#mark_complete', as: 'mark'

end
