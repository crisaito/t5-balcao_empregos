Rails.application.routes.draw do
  root "home#index"
  
  devise_for :recruiters, controllers: { registrations: "recruiter/registrations" }
  devise_for :candidates, controllers: { registrations: "candidate/registrations" }

  resources :companies, only: [:index, :show, :edit, :update, :new, :create] do
    resources :jobs, only: [:show, :new, :create] do
        post 'apply', on: :member
    end
  end

  resources :candidates, only: [:show, :edit, :update]
  resources :job_applications, only: [:show, :edit, :update] do
    patch 'recruiter_rejected', on: :member
    patch 'recruiter_approved', on: :member
    patch 'candidate_accepted', on: :member
    patch 'candidate_declined', on: :member
  end
end
