Rails.application.routes.draw do
  
  get '/tasks', to: 'tasks#index', as: 'tasks'
  # tasks_path helper method to give you the right url
  # when you use link_to etc in the views for user to take action on
  
  get '/tasks/new', to: 'tasks#new', as: 'new_task'
end
