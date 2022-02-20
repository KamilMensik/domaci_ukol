Rails.application.routes.draw do
  root "g#index"
  devise_for :users
  get 'g/index'
  get "g/test"
  resources :tags
  resources :projects
  resources :tasks
  get "g/search", as: "search"
  get "tasks/:id/complete", to: "tasks#complete", as: "complete"
end
