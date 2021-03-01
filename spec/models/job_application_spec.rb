require 'rails_helper'

describe JobApplication do
  context 'validation' do
    it 'decrease total jobs when candidate accept proposal' do
      pepsico = Company.new
      candidate = Candidate.new(email: 'saito@gmail.com', password: '123456')
      job = Job.create!(total_jobs:'5', company: pepsico)
      application = JobApplication.create(candidate: candidate, job: job)

      application.decrease_total_jobs
      expect(application.job.total_jobs).to eq 4
    end
  end
end