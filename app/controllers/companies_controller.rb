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
    @company = Company.new(params.require(:company).permit(
      :name,
      :description,
      :address,
      :cnpj,
      :website,
      :linkedin,
      :logo))
    if @company.save
      redirect_to @company
    else  
      render 'new'
    end
  end
end