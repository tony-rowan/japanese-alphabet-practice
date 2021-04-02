Rails.application.routes.draw do
  root "characters#show"

  resources :characters, only: [:index, :show]
end
