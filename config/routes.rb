Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb 'path', to: 'controller#action'
  get '/tasks', to: 'tasks#index'
  # verb 'root', to: 'controller#action'
  root 'tasks#index'
end
