Rails.application.routes.draw do
  root "home#index"

  resources :companies, only: [:index] do
  end
end
