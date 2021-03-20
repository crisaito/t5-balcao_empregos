Rails.application.routes.draw do
  root "home#index"
  get 'search', to:"home#search"
  
  devise_for :recruiters, controllers: { registrations: "recruiters/registrations" }
  devise_for :candidates, controllers: { registrations: "candidate/registrations" }

  resources :companies, only: [:index, :show, :new, :create, :edit, :update] do
    resources :jobs, only: [:show, :new, :create, :edit, :update] do
        post 'apply', on: :member
    end
  end

  resources :candidates, only: [:show, :edit, :update]
  resources :job_applications, only: [:show, :edit, :update] do
    resources :recruiter_feedbacks, only: [:show, :edit, :update] do
      patch 'recruiter_rejected', on: :member
      patch 'recruiter_approved', on: :member
    end
    # patch 'candidate_accepted', on: :member
    # patch 'candidate_declined', on: :member
  end
end
