Rails.application.routes.draw do
  get 'assignments/new'
  resources :projects
  resources :people
  resources :assignments
post 'assignments/new', to: 'assignments#new'
  post 'assignments', to: 'assignments#create'
  root 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
