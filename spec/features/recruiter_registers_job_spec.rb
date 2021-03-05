require 'rails_helper'

feature 'Recruiter registers job from company' do

  scenario 'successfully' do
    recruiter = Recruiter.create!(email: 'saito@pepsi.com', password: '123456')
    login_as recruiter, scope: :recruiter
    
    visit root_path
    click_on 'Painel'
    click_on 'Cadastrar vaga'
    
    fill_in 'Título da vaga', with: 'Senior developer'
    fill_in 'Descrição', with: 'Principais Atividades: Desenvolver serviços web'
    fill_in 'Salário', with: '10000'
    fill_in 'Nível', with: 'Senior'
    fill_in 'Requisitos', with: 'Foco em performance, Ruby on Rails'
    fill_in 'Data de expiração da vaga', with: '21/02/2021'
    fill_in 'Total de vagas', with: '5'
    click_on 'Cadastrar Vaga'

    expect(current_path).to eq(company_job_path(Company.last, Job.last))
    expect(page).to have_content('Senior developer')
    expect(page).to have_content('Principais Atividades: Desenvolver serviços web')
    expect(page).to have_content('R$ 10.000,00')
    expect(page).to have_content('Senior')
    expect(page).to have_content('Foco em performance, Ruby on Rails')
    expect(page).to have_content('21/02/2021')
    expect(page).to have_content('5')
    expect(page).to have_link('Voltar')
  end

  scenario 'and edits' do
    dolly = Company.create!(name:'Dolly')
    recruiter = Recruiter.create!(email: 'saito@dolly.com', password: '123456')
    Job.create!(title: 'Analista', total_jobs: 1, expiration_date: '30/10/2021', company: dolly)
    login_as recruiter, scope: :recruiter

    visit root_path
    click_on 'Painel'
    click_on 'Analista'
    click_on 'Editar vaga'

    fill_in 'Título da vaga', with: 'Senior developer'
    click_on 'Editar Vaga'

    expect(page).to have_content('Senior developer')
  end

  scenario 'cannot view another job edit link' do
    dolly = Company.create!(name:'Dolly')
    coca = Company.create!(name:'Coca')
    recruiter = Recruiter.create!(email: 'saito@dolly.com', password: '123456')
    Recruiter.create!(email: 'saito@coca.com', password: '123456')
    Job.create!(title: 'Dentista', total_jobs: 1, expiration_date: '30/10/2021', company: coca)
    login_as recruiter, scope: :recruiter

    visit root_path
    click_on 'Empresas'
    click_on 'Coca'
    click_on 'Dentista'

    expect(page).not_to have_link('Editar vaga') 
  end

  scenario 'cannot view another job register link' do
    dolly = Company.create!(name:'Dolly')
    coca = Company.create!(name:'Coca')
    recruiter = Recruiter.create!(email: 'saito@dolly.com', password: '123456')
    Recruiter.create!(email: 'saito@coca.com', password: '123456')
    login_as recruiter, scope: :recruiter

    visit root_path
    click_on 'Empresas'
    click_on 'Coca'

    expect(page).not_to have_link('Cadastrar vaga') 
  end
end

