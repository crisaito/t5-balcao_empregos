require 'rails_helper'

feature 'Candidate views recruiter reply' do
  scenario 'rejected' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: "10/10/2021", company: pepsico)
    JobApplication.create!(candidate: candidate, job: job, status: 1)
    login_as candidate, scope: :candidate

    visit root_path
    click_on 'Painel'
    
    expect(page).to have_content('Status: candidatura desconsiderada')
  end
end