require 'rails_helper'

feature 'Candidate apply for job' do
  scenario 'successfully' do
    Candidate.create!(email: 'cris@gmail.com', password: '123456')
    pepsico = Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                              address: 'São Paulo, SP', cnpj: '31565104000177', 
                              website: 'www.pepsico.com.br', 
                              linkedin: 'www.linkedin.com/company/pepsico')
    Job.create!(title: 'Senior developer', description: 'Principais Atividades: 
                Desenvolver serviços web funcionais utilizando HTML5, 
                FluentUI, Node.js, Ruby on Rails, React', 
                compensation: '10000', experience_level: 'Senior', 
                requirements: 'Foco em performance, Ruby on Rails', 
                expiration_date: '21/02/2021',
                total_jobs:'5', company: pepsico) 
    
    visit root_path
    click_on 'Candidato'

    within('form') do
      fill_in 'E-mail', with: 'cris@gmail.com' 
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end

    click_on 'Empresas'
    click_on 'Pepsi'
    click_on 'Senior developer'
    click_on 'Enviar'
    
    expect(JobApplication.all.size).to eq 1
    expect(page).to have_content('Você candidatou-se para a vaga com sucesso!')
  end
end