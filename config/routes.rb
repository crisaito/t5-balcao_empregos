Rails.application.routes.draw do
  root "home#index"
  
  devise_for :recruiters

  resources :companies, only: [:index] do
  end
end
