class JobApplication < ApplicationRecord
  belongs_to :candidate
  belongs_to :job

  enum status: { pending: 0, recruiter_rejected: 1, recruiter_approved: 2, candidate_accepted: 3, candidate_declined: 4}
end