require 'rails_helper'

feature 'Candidate edits profile' do
  scenario 'successfully' do
    candidate = Candidate.create!(email: 'saito@gmail.com', password: '123456')

    visit root_path
    click_on 'Candidato'

    within('form') do
      fill_in 'E-mail', with: 'saito@gmail.com' 
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end
    
    click_on 'Editar perfil'

    within('form') do
      fill_in 'E-mail', with: 'cris@gmail.com' 
      click_on 'Salvar'
    end

    expect(page).to have_content 'Painel do Candidato'
    expect(page).to have_content 'cris@gmail.com'
  end
end