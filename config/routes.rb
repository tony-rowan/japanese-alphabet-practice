Rails.application.routes.draw do
  root "questions#show"

  resources :characters, only: [:index, :show]
end
