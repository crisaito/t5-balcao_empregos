class CandidateFeedbacksController < ApplicationController

  def update
    @candidate_feedback = CandidateFeedback.find(params[:id]) 
    @job_application = JobApplication.find(params[:id])
    
    if @candidate_feedback.update(params.require(:candidate_feedback).permit(
      :declined_msg))
      redirect_to @job_application
    else
      render :edit
    end
  end
  
  def candidate_declined
    @job_application = JobApplication.find(params[:id])
    @candidate_feedback = CandidateFeedback.find(params[:id])
    
    @job_application.candidate_feedback_declined

  end
  
  def candidate_accepted
    @job_application = JobApplication.find(params[:id])
    @candidate_feedback = CandidateFeedback.find(params[:id])
  
    @job_application.candidate_feedback_accepted
  end
end