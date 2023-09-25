Rails.application.routes.draw do

  get "/scientists/:id", to: "scientists#show"

end
