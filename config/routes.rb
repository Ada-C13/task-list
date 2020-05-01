Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/tasks' => 'tasks#index'
  get '/tasks/:id' => 'tasks#show'
  root :to => "tasks#index"
  # root to: "tasks#index"
end
