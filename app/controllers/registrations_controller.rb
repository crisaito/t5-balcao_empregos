class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    array = Recruiter.pluck(:company_name)
    array.pop
    if array.include?(resource.company_name)
      company_path(resource) 
    else
      edit_company_path(resource)
    end
  end
end