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
                expiration_date: Date.today + 1,
                total_jobs:'5', company: pepsico)
    
    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'

    expect(page).to have_link('Senior developer')
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
                expiration_date: Date.today + 1,
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
    expect(page).to have_content(Date.parse((Date.today + 1).to_s).strftime('%d/%m/%Y'))
    expect(page).to have_content('5')
  end

  scenario 'if total applications less total jobs' do
    pepsico = Company.new(name:'Pepsi')
    candidate = Candidate.new(email: 'saito@pepsi.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Analista', total_jobs:'1', total_application: 0, expiration_date: Date.today + 1, company: pepsico)
    application = JobApplication.create(candidate: candidate, job: job)

    job.increase_total_application
    
    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'

    expect(job.total_application).to eq 1
    expect(page).not_to have_content('Analista')
  end

  scenario 'if not expired date' do
    pepsico = Company.new(name:'Pepsi')
    candidate = Candidate.new(email: 'saito@pepsi.com', password: '123456', full_name: 'Cris Saito')
    job = Job.create!(title: 'Analista', total_jobs:'1', expiration_date: Date.today - 1, company: pepsico)
    job2 = Job.create!(title: 'Diretoria', total_jobs:'1', expiration_date: Date.today + 1, company: pepsico)

    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'

    expect(page).not_to have_content('Analista')
    expect(page).to have_content('Diretoria')
  end
end