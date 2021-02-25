require 'rails_helper'

feature 'Visitor visits home page' do
  scenario 'successfully' do
    visit root_path
  
    expect(page).to have_content('Balcão de Empregos') 
    expect(page).to have_content('Cadastre sua empresa e divulgue vagas') 
    expect(page).to have_content('Faça seu cadastro para se candidatar às vagas de emprego') 

  end
end