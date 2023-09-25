Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/scientists/:id", to: "scientists#show"
  patch "/scientists/:id/update/:experiment_id", to: "scientists#update"

  get "/experiments", to: "experiments#index"
end
