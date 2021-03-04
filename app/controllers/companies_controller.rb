class CompaniesController < ApplicationController
  before_action :authenticate_recruiter!, except: [:index, :show]
  before_action :only_recruiter_company, except: [:index, :show]

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @recruiter = current_recruiter
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else  
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])

    if @company.update(company_params)
      redirect_to @company
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :description,
      :address,
      :cnpj,
      :website,
      :linkedin,
      :logo)
  end

  def only_recruiter_company
    company = Company.find(params[:id])

    unless current_recruiter.company_id == company.id
    redirect_to company_path(current_recruiter.company_id)
    end
  end
end