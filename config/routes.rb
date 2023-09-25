Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :scientists, only: [:show]
  delete "/scientists/:scientist_id/experiments/:experiment_id", to: "scientist_experiments#destroy"
end
