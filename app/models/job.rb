class Job < ApplicationRecord
  belongs_to :company
  has_many :job_applications
  has_many :candidates, through: :job_applications

  enum status: { enabled: 0, disabled: 1}

  def increase_total_application
    self.increment!(:total_application)
    if self.total_jobs == self.total_application
      self.disabled!
    end
  end
end