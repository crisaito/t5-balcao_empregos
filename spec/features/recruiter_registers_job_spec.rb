require 'rails_helper'

feature 'Recruiter registers job' do

  scenario 'sucessfully' do
    recruiter = Recruiter.create!(email: 'saito@pepsi.com', password: '123456')

    visit root_path
    click_on 'Recrutador'

    within('form') do
      fill_in 'E-mail', with: 'saito@pepsi.com' 
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end  
    
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
end

