class CandidatesController < ApplicationController
  def show
    @candidate = Candidate.find(params[:id])
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])

    if @candidate.update(params.require(:candidate).permit(
      :email,
      :full_name,
      :tel,
      :city,
      :state,
      :bio))
      redirect_to @candidate
    else
      render :edit
    end
  end
end