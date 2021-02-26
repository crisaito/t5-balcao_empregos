require 'rails_helper'

feature 'Recruiter registers company' do

  scenario 'successfully' do

    visit root_path
    click_on 'Recrutador'
    click_on 'Sign up'

    within('form') do
      fill_in 'E-mail', with: 'cris@cocacola.com.br' 
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Sign up'
    end  
    
    attach_file 'Logo', Rails.root.join('spec', 'support', 'logo.png')
    fill_in 'Descrição', with: 'Empresa de bebidas'
    fill_in 'Endereço', with: ' São Paulo, SP'
    fill_in 'CNPJ', with: '31565104000177'
    fill_in 'Website', with: 'www.pepsico.com.br'
    fill_in 'Linkedin', with: 'www.linkedin.com/company/pepsico'
    click_on 'Cadastrar Empresa'

    expect(current_path).to eq(company_path(Company.last))
    expect(page).to have_content('Cocacola')
    expect(page).to have_content('Empresa de bebidas')
    expect(page).to have_content('São Paulo, SP')
    expect(page).to have_content('31565104000177')
    expect(page).to have_content('www.pepsico.com.br')
    expect(page).to have_content('www.linkedin.com/company/pepsico')
    expect(page).to have_css('img[src*="logo.png"]')
  end
end