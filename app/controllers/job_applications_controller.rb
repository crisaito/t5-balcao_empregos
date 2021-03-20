class JobApplicationsController < ApplicationController
  #before_action :authenticate_candidate!
  #before_action :authenticate_recruiter!

  def show
    @job_application = JobApplication.find(params[:id])
    @recruiter_feedback = RecruiterFeedback.find(params[:id])
    @candidate_feedback = CandidateFeedback.find(params[:id])
  end

  def edit
    @job_application = JobApplication.find(params[:id])
  end
  
  def update
    @job_application = JobApplication.find(params[:id])

    if @job_application.update(params.require(:job_application).permit(
      :status,
      :candidate_id,
      :job_id))
      redirect_to @job_application
    else
      render :edit
    end
  end
end