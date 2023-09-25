Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  delete "/scientists/:scientist_id/experiments/:id", to: "scientist_experiments#destroy"
  
  resources :labs

  resources :scientists do
    resources :experiments
  end
end
