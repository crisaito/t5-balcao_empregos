class CompaniesController < ApplicationController
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
end