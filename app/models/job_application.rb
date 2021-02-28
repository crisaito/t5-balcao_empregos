class JobApplication < ApplicationRecord
  belongs_to :candidate
  belongs_to :job

  enum status: { pending: 0, rejected: 1, approved: 2 }

  def reason
    "motivo x"
  end
end