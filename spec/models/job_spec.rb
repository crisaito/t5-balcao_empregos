require 'rails_helper'

describe Job do
  context 'validation' do
    it 'increase total application when candidate accept proposal' do
      pepsico = Company.new
      candidate = Candidate.new(email: 'saito@gmail.com', password: '123456', full_name: 'Cris Saito')
      job = Job.create!(total_jobs:'2', total_application: 0, expiration_date: "10/10/2021", company: pepsico)
      application = JobApplication.create(candidate: candidate, job: job)

      job.increase_total_application
    
      expect(job.total_application).to eq 1
    end

    it 'total application disabled when eq total jobs' do
      pepsico = Company.new
      candidate = Candidate.new(email: 'saito@gmail.com', password: '123456', full_name: 'Cris Saito')
      job = Job.create!(total_jobs:'2', total_application: 1, expiration_date: "10/10/2021", company: pepsico)
      application = JobApplication.create(candidate: candidate, job: job)

      job.increase_total_application
    
      expect(job.total_application).to eq 2
      expect(job.disabled?).to be_truthy
    end
  end
end