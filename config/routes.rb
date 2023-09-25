Rails.application.routes.draw do

  get "/scientists/:id", to: "scientists#show"
  post "/scientists/:id", to: "scientists#destroy"
end
