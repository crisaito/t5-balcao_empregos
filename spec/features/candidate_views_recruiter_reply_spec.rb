require 'rails_helper'

feature 'Candidate views recruiter feedback' do
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

  scenario 'approved' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: "10/10/2021", company: pepsico)
    JobApplication.create!(candidate: candidate, job: job, status: 2)
    login_as candidate, scope: :candidate

    visit root_path
    click_on 'Painel'
    
    expect(page).to have_content('Status: candidatura aprovada')
  end

  scenario 'and decline offer' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: "10/10/2021", company: pepsico)
    job_application = JobApplication.create!(candidate: candidate, job: job, status: 2)
    login_as candidate, scope: :candidate
    RecruiterFeedback.update(id: 1, job_application: job_application, approved_msg: 'Parabéns', 
      rejected_msg: nil, proposed_compensation: '10000', date_start: '10/10/2021')
    visit root_path
    click_on 'Painel'
    click_on 'Detalhes'
    click_on 'Rejeitar proposta'
    fill_in 'Motivo', with: 'mudança de cidade'
    click_on 'Enviar motivo'
    
    expect(page).to have_content('mudança de cidade')
  end
end