Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  # source: https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/routes-and-resources.md
  root to: "tasks#index"
  
  resources :tasks

  # custom route
  patch '/tasks/:id/mark', to: 'tasks#mark_complete', as: 'mark'

end
