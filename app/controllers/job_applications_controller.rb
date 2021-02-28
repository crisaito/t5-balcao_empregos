class JobApplicationsController < ApplicationController

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
      :status,
      :candidate_id,
      :job_id))
      redirect_to @job_application
    else
      render :edit
    end
  end

  def reject
    @job_application = JobApplication.find(params[:id])
    @job_application.rejected!
  end

  def approved
    @job_application = JobApplication.find(params[:id])
    @job_application.approved!
  end
end