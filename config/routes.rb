Rails.application.routes.draw do
  devise_for :users
  get 'g/index'
  get "g/test"
  root "g#index"
  get "tasks/:id/complete", to: "tasks#complete", as: "complete"

  resources :tags
  resources :projects
  resources :tasks
  get "g/search", as: "search"
end
