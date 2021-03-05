class JobApplicationsController < ApplicationController
  before_action :authenticate_candidate!
  before_action :authenticate_recruiter!


  def show
    @job_application = JobApplication.find(params[:id])
  end

  def edit
    @job_application = JobApplication.find(params[:id])
  end
  
  def update
    @job_application = JobApplication.find(params[:id])

    if @job_application.update(params.require(:job_application).permit(
      :date_start,
      :proposed_compensation,
      :msg_rejected,
      :msg_approved,
      :msg_declined,
      :status,
      :candidate_id,
      :job_id))
      redirect_to @job_application
    else
      render :edit
    end
  end

  def recruiter_rejected
    @job_application = JobApplication.find(params[:id])
    @job_application.recruiter_rejected!
  end

  def recruiter_approved
    @job_application = JobApplication.find(params[:id])
    @job_application.recruiter_approved!
  end

  def candidate_accepted
    @job_application = JobApplication.find(params[:id])
    job = Job.find(params[:id])
    @job_application.candidate_accepted!
    job.increase_total_application
  end

  def candidate_declined
    @job_application = JobApplication.find(params[:id])
    @job_application.candidate_declined!
  end
end