# frozen_string_literal: true

class Recruiters::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    array = Recruiter.pluck(:company_name)
    array.pop
    if array.include?(resource.company_name)
      company_path(resource.company_id) 
    else
      edit_company_path(resource.company.id)
    end
  end
end
