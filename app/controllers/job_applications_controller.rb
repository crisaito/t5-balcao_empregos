class JobApplicationsController < ApplicationController
  before_action :authenticate_candidate!

  def show
    @job = Job.find(params[:id])
    @candidate = Candidate.find(params[:id])
  end
end