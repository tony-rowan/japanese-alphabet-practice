Rails.application.routes.draw do
  root "flashcards#show"

  resources :characters, only: [:index, :show]
end
