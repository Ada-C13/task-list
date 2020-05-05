Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root path
  root :to => 'tasks#index'

  resources :tasks

  # route for marking complete
  post 'tasks/:id', to: 'tasks#complete', as: 'complete'

end
