class JobApplication < ApplicationRecord
  belongs_to :candidate
  belongs_to :job
  has_one :recruiter_feedback

  enum status: { pending: 0, recruiter_rejected: 1, recruiter_approved: 2, candidate_accepted: 3, candidate_declined: 4}

  after_create :create_recruiter_feedback

  def recruiter_feedback_rejected
    self.recruiter_rejected!
  end

  def recruiter_feedback_approved
    self.recruiter_approved!
  end
 
  def candidate_feedback_declined
    self.candidate_declined!
  end

  def candidate_feedback_accepted
    self.candidate_accepted!
  end

  def create_recruiter_feedback
    RecruiterFeedback.create!(id: self.id ,job_application: self)
  end 
end