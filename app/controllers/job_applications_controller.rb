class JobApplicationsController < ApplicationController
  def reject
    @job_application = JobApplication.find(params[:id])
    @job_application.rejected!
  end
end