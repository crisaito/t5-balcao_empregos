require 'rails_helper'

feature 'Visitor view companies' do
  scenario 'successfully' do
    Recruiter.create!(email: 'saito@pepsi.com', password: '123456')
    Company.create!(description: 'Empresa de bebidas', 
                    address: 'São Paulo, SP', cnpj: '31565104000177', 
                    website: 'www.pepsico.com.br', 
                    linkedin: 'www.linkedin.com/company/pepsico')
   
    visit root_path
    click_on 'Empresas'
    
    expect(page).to have_content('Pepsi')
    expect(page).to have_content('Empresa de bebidas')
    expect(page).to have_content('São Paulo, SP')
    expect(page).to have_content('31565104000177')
    expect(page).to have_content('www.pepsico.com.br')
    expect(page).to have_content('www.linkedin.com/company/pepsico')
  end

  scenario 'and view details' do
    Company.create!(name: 'Pepsi', description: 'Empresa de bebidas', 
                    address: 'São Paulo, SP', cnpj: '31565104000177', 
                    website: 'www.pepsico.com.br', 
                    linkedin: 'www.linkedin.com/company/pepsico')

    visit root_path
    click_on 'Empresas'
    click_on 'Pepsi'

    expect(page).to have_content('Pepsi')
    expect(page).to have_content('Vagas Disponíveis')
    expect(page).to have_link('Voltar')
  end
end