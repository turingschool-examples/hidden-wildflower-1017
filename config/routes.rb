Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # US 1
  get "/scientists/:id", to: "scientists#show"

  # US 2
  delete "/scientists/:scientist_id/experiments/:experiment_id", to: "scientists#remove_experiment"
end
