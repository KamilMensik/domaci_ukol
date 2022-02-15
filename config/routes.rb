Rails.application.routes.draw do
  devise_for :users
  get 'g/index'
  get "g/test"
  root "g#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tags
end
