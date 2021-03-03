require 'rails_helper'

feature 'Visitor visits home page' do
  scenario 'successfully' do
    visit root_path
  
    expect(page).to have_content('Balcão de Empregos') 
    expect(page).to have_content('Cadastre sua empresa e divulgue vagas') 
    expect(page).to have_content('Faça seu cadastro para se candidatar às vagas de emprego') 
    expect(page).to have_link('Empresas') 

  end

  scenario 'and search for company/job'do
    pepsico = Company.create!(name: 'Pepsi', description: 'Empresa de bebidas')
    dolly = Company.create!(name: 'Dolly', description: 'Empresa de refris')
    Job.create!(title: 'engenharia de alimentos', company: pepsico) 
    Job.create!(title: 'engenharia química', company: dolly) 

    visit root_path
    fill_in 'Buscar', with: 'engenharia'
    click_on 'Pesquisar'

    expect(current_path).to eq search_path
    expect(page).to have_content('Pepsi')
    expect(page).to have_content('engenharia de alimentos')
    expect(page).to have_content('Dolly')
    expect(page).to have_content('engenharia química')
  end
end