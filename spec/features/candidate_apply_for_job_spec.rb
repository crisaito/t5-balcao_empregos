require 'rails_helper'

feature 'Candidate apply for job' do
  scenario 'successfully' do
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    pepsico = Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                              address: 'São Paulo, SP', cnpj: '31565104000177', 
                              website: 'www.pepsico.com.br', 
                              linkedin: 'www.linkedin.com/company/pepsico')
    Job.create!(title: 'Senior developer', description: 'Principais Atividades: 
                Desenvolver serviços web funcionais utilizando HTML5, 
                FluentUI, Node.js, Ruby on Rails, React', 
                compensation: '10000', experience_level: 'Senior', 
                requirements: 'Foco em performance, Ruby on Rails', 
                expiration_date: Date.today + 1,
                total_jobs:'5', company: pepsico) 
    login_as candidate, scope: :candidate

    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'
    click_on 'Senior developer'
    click_on 'Enviar'
    
    expect(JobApplication.all.size).to eq 1
    expect(page).to have_content('Você candidatou-se para a vaga com sucesso!')
    expect(page).to have_content('Senior developer')
    expect(page).to have_content('Status: pendente de avaliação')
  end

  scenario 'only once' do
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    pepsico = Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                              address: 'São Paulo, SP', cnpj: '31565104000177', 
                              website: 'www.pepsico.com.br', 
                              linkedin: 'www.linkedin.com/company/pepsico')
    job = Job.create!(title: 'Senior developer', description: 'Principais Atividades: 
                Desenvolver serviços web funcionais utilizando HTML5, 
                FluentUI, Node.js, Ruby on Rails, React', 
                compensation: '10000', experience_level: 'Senior', 
                requirements: 'Foco em performance, Ruby on Rails', 
                expiration_date: Date.today + 1,
                total_jobs:'5', company: pepsico) 
    JobApplication.create!(candidate: candidate, job: job)
    login_as candidate, scope: :candidate

    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'
    click_on 'Senior developer'
    click_on 'Enviar'

    expect(JobApplication.all.size).to eq 1
    expect(page).to have_content('Você já candidatou-se para a vaga anteriormente!')
  end
end