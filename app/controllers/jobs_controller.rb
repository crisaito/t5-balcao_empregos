class JobsController < ApplicationController
  before_action :authenticate_recruiter!, only: [:new, :create, :edit, :update]
  before_action :authenticate_candidate!, only: [:apply]

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
    @job = @company.jobs.new(job_params)
    if @job.save
      redirect_to company_job_path(@company, @job)
    else  
      render 'new'
    end
  end

  def edit    
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])

    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def apply
    job = Job.find(params[:id])
    JobApplication.create!(candidate: current_candidate, job: job)
    flash[:apply] = 'Você candidatou-se para a vaga com sucesso!'
    redirect_to current_candidate
  end

  private

  def job_params
    params.require(:job).permit(
      :title,
      :description,
      :compensation,
      :experience_level,
      :requirements,
      :expiration_date,
      :total_jobs,
      :company_id)
  end
end