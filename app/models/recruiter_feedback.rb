class RecruiterFeedback < ApplicationRecord
  belongs_to :job_application

  after_create :create_candidate_feedback

  def create_candidate_feedback
    CandidateFeedback.create!(id: self.id ,recruiter_feedback: self)
  end 
end
