class JobApplicationsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    @candidate = Candidate.find(params[:id])
  end
end