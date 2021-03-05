require 'rails_helper'

feature 'Recruiter view job application' do
  scenario 'successfully' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: "10/10/2021", company: pepsico)
    JobApplication.create!(candidate: candidate, job: job)
    login_as recruiter, scope: :recruiter

    visit root_path
    click_on "Painel"
    click_on 'Senior developer'

    expect(page).to have_content('Cris Saito')
    expect(page).to have_content('Status: pendente de avaliação')
    expect(page).to have_link('Detalhes')
  end

  scenario 'and see details' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: "10/10/2021", company: pepsico)
    JobApplication.create!(candidate: candidate, job: job)
    login_as recruiter, scope: :recruiter

    visit root_path
    click_on "Painel"
    click_on 'Senior developer'
    click_on 'Detalhes'

    expect(page).to have_link('Rejeitar')
    expect(page).to have_link('Aceitar')
  end

  scenario 'and decline candidate' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: "10/10/2021", company: pepsico)
    job_application = JobApplication.create!(candidate: candidate, job: job)
    login_as recruiter, scope: :recruiter

    visit root_path
    click_on "Painel"
    click_on 'Senior developer'
    click_on 'Detalhes'
    click_on 'Rejeitar'
    
    job_application.reload

    expect(job_application.recruiter_rejected?).to be_truthy
  end

  scenario 'and approve candidate' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: "10/10/2021", company: pepsico)
    job_application = JobApplication.create!(candidate: candidate, job: job)
    login_as recruiter, scope: :recruiter

    visit root_path
    click_on "Painel"
    click_on 'Senior developer'
    click_on 'Detalhes'
    click_on 'Aceitar'

    job_application.reload

    expect(job_application.recruiter_approved?).to be_truthy
  end
end