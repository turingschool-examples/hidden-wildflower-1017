Rails.application.routes.draw do
  get '/scientists/:scientist_id', to: 'scientists#show', as: 'show_scientist'
  delete '/scientists/:scientist_id/experiments/:id', to: 'scientist_experiments#destroy', as: 'destroy_scientist_experiment'
end
