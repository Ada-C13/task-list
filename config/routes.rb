Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tasks#index'

  resources :tasks do
    patch 'mark_incomplete', on: :member
    patch 'mark_complete', on: :member
  end

end


  