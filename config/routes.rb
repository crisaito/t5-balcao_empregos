Rails.application.routes.draw do
  root "home#index"
  
  devise_for :recruiters, controllers: { registrations: "recruiter/registrations" }
  devise_for :candidates, controllers: { registrations: "candidate/registrations" }


  resources :companies, only: [:index, :show, :edit, :update, :new, :create] do
    resources :jobs, only: [:show, :new, :create]
  end

  resources :candidates, only: [:show]
end
