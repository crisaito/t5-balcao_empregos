require 'rails_helper'

feature 'Visitor view jobs' do
  scenario 'of a company' do 
    pepsico = Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                    address: 'São Paulo, SP', cnpj: '31.565.104/0001-97', 
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
    click_on 'Empresas'
    click_on 'Pepsi'

    expect(page).to have_content('Senior developer')
    expect(page).to have_content('R$ 10.000')
    expect(page).to have_content('Senior')
  end

  scenario 'and view details' do
    pepsico = Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                              address: 'São Paulo, SP', cnpj: '31.565.104/0001-97', 
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
    click_on 'Empresas'
    click_on 'Pepsi'
    click_on 'Senior developer'

    expect(page).to have_content('Senior developer')
    expect(page).to have_content('Principais Atividades: Desenvolver '\
                                 'serviços web funcionais utilizando HTML5, '\
                                 'FluentUI, Node.js, Ruby on Rails, React')
    expect(page).to have_content('R$ 10.000')
    expect(page).to have_content('Senior')
    expect(page).to have_content('Foco em performance, Ruby on Rails')
    expect(page).to have_content('21/02/2021')
    expect(page).to have_content('5')
  end

  scenario 'if total jobs differs from 0' do
    pepsico = Company.new(name:'Pepsi')
    candidate = Candidate.new(email: 'saito@pepsi.com', password: '123456')
    job = Job.create!(title: 'Analista', total_jobs:'1', company: pepsico)
    application = JobApplication.create(candidate: candidate, job: job)

    application.decrease_total_jobs
    
    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'

    expect(application.job.total_jobs).to eq 0
    expect(page).not_to have_content('Analista')
  end
end