Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :labs, only: [:show]
  resources :scientists, only: [:show]
  resources :experiments, only: [:index]
  resources :scientist_experiments, only: [:destroy]

end
