require 'rails_helper'

feature 'Recruiter view job application' do
  scenario 'successfully' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: Date.today + 1, company: pepsico)
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
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: Date.today + 1, company: pepsico)
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
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: Date.today + 1, company: pepsico)
    job_application = JobApplication.create!(candidate: candidate, job: job)
    login_as recruiter, scope: :recruiter

    visit root_path
    click_on "Painel"
    click_on 'Senior developer'
    click_on 'Detalhes'
    click_on 'Rejeitar candidatura'
    fill_in 'Motivo', with: 'infelizmente não foi dessa vez :('
    click_on 'Enviar motivo'
    
    job_application.reload
    expect(page).to have_content('candidatura desconsiderada')
    expect(page).to have_content('infelizmente não foi dessa vez :(')
    expect(job_application.recruiter_rejected?).to be_truthy
  end
  
  scenario 'and approve candidate' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'ana@pepsi.com', password: '123456')
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Senior developer', total_jobs: 1, expiration_date: Date.today + 1, company: pepsico)
    job_application = JobApplication.create!(candidate: candidate, job: job)
    login_as recruiter, scope: :recruiter
    
    visit root_path
    click_on "Painel"
    click_on 'Senior developer'
    click_on 'Detalhes'
    click_on 'Aceitar candidatura'
    fill_in 'Boas Vindas', with: 'Parabéns'
    fill_in 'Proposta Salarial', with: '10000'
    fill_in 'Data de início', with: '21/04/2021'
    click_on 'Enviar proposta'
    
    job_application.reload
    expect(page).to have_content('candidatura aprovada')
    expect(page).to have_content('Parabéns')
    expect(page).to have_content('R$ 10.000')
    expect(page).to have_content('21/04/2021')
    expect(job_application.recruiter_approved?).to be_truthy
  end
end