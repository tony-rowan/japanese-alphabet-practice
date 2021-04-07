Rails.application.routes.draw do
  root "questions#show"

  resources :answers, only: [:create]
  resources :characters, only: [:index, :show]
end
