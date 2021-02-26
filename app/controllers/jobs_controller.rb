class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def new
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new
  end

  def create    
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(params.require(:job).permit(
      :title,
      :description,
      :compensation,
      :experience_level,
      :requirements,
      :expiration_date,
      :total_jobs,
      :company_id))
    if @job.save
      redirect_to company_job_path(@company, @job)
    else  
      render 'new'
    end
  end
end