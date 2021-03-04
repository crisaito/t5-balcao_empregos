require 'rails_helper'

feature 'Recruiter views company that belongs to' do
  scenario 'successfully' do
    pepsico = Company.create!(name: 'Pepsi')
    recruiter = Recruiter.create!(email: 'saito@pepsi.com', password: '123456', company: pepsico)
    login_as recruiter, scope: :recruiter

    visit root_path
    click_on 'Painel'

    expect(current_path).to eq company_path(pepsico)
  end

  scenario 'and edits company as admin' do
    pepsico = Company.create!(name: 'Pepsi', website: 'www.pepsi.com')
    admin = Recruiter.create!(email: 'saito@pepsi.com', password: '123456', role: 0, company: pepsico)
    login_as admin, scope: :recruiter

    visit root_path
    click_on 'Painel'
    click_on 'Editar empresa'
    fill_in 'Website', with: 'www.pepsico.com.br' 
    click_on 'Cadastrar Empresa'

    expect(current_path).to eq company_path(pepsico)
    expect(page).to have_content('Pepsi') 
    expect(page).to have_content('www.pepsico.com.br') 
  end

  scenario 'and cannot edits company as member' do
    pepsico = Company.create!(name: 'Pepsi')
    member = Recruiter.create!(email: 'ana@pepsi.com', password: '123456', role: 1, company: pepsico)
    login_as member, scope: :recruiter

    visit root_path
    click_on 'Painel'

    expect(page).not_to have_link('Editar empresa') 
  end

  scenario 'and cannot view another company edit' do
    coca = Company.create!(name: 'Coca', website: 'www.coca.com')
    pepsico = Company.create!(name: 'Pepsi', website: 'www.pepsi.com')
    admin = Recruiter.create!(email: 'saito@pepsi.com', password: '123456', company: pepsico)
    login_as admin, scope: :admin

    visit root_path
    click_on 'Empresas'
    click_on 'Coca'

    expect(page).not_to have_link('Editar empresa') 
  end
end