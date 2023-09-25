Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :experiments, only: [:index]
  
  resources :scientists do
    resources :scientists_experiments, only: [:destroy]
  end
end
