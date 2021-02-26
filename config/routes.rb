Rails.application.routes.draw do
  root "home#index"
  
  devise_for :recruiters, controllers: { registrations: "registrations" }

  resources :companies, only: [:index, :show, :edit, :update, :new, :create] do
    resources :jobs, only: [:show, :new, :create]
  end
end
