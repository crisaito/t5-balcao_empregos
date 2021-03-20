require 'rails_helper'

describe RecruiterFeedback do
  context 'are create' do
    it 'successfully' do
      pepsico = Company.create!(name: 'Pepsi')
      recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
      candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
      job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: "10/10/2021", company: pepsico)
      job_application = JobApplication.create!(id: 10, candidate: candidate, job: job)
      
      expect(RecruiterFeedback.last.valid?).to be_truthy
      expect(RecruiterFeedback.last.id).to eq 10
    end
  end
end
  