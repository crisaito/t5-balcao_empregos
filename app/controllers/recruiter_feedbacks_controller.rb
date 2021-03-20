class RecruiterFeedbacksController < ApplicationController
  def edit
    @recruiter_feedback = RecruiterFeedback.find(params[:id])
    @job_application = JobApplication.find(params[:id])
  end
  
  def update
    @recruiter_feedback = RecruiterFeedback.find(params[:id]) 
    @job_application = JobApplication.find(params[:id])
    
    if @recruiter_feedback.update(params.require(:recruiter_feedback).permit(
      :rejected_msg, :approved_msg, :proposed_compensation, :date_start))
      redirect_to @job_application
    else
      render :edit
    end
  end
  
  def recruiter_rejected
    @job_application = JobApplication.find(params[:id])
    @recruiter_feedback = RecruiterFeedback.find(params[:id])
    
    @job_application.recruiter_feedback_rejected
  end
  
  def recruiter_approved
    @job_application = JobApplication.find(params[:id])
    @recruiter_feedback = RecruiterFeedback.find(params[:id])
  
    @job_application.recruiter_feedback_approved
  end
end
