class Candidate::RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:candidate).permit(:email, :password, :password_confirmation, :full_name, :tel, :city, :state, :bio, :job_id)
  end
end