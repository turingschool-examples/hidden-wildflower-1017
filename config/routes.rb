Rails.application.routes.draw do
  get '/scientists/:scientist_id', to: 'scientists#show'
end
