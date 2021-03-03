require 'rails_helper'

feature 'Candidate edits profile' do
  scenario 'successfully' do
    candidate = Candidate.create!(email: 'saito@gmail.com', password: '123456', full_name: 'Cris Saito')
    login_as candidate, scope: :candidate

    visit root_path
    click_on 'Painel'
    click_on 'Editar perfil'
    fill_in 'E-mail', with: 'cris@gmail.com' 
    click_on 'Salvar'

    expect(page).to have_content 'Painel do Candidato'
    expect(page).to have_content 'cris@gmail.com'
  end

  scenario 'and full name or email cannot be blank' do
    candidate = Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    login_as candidate, scope: :candidate

    visit root_path
    click_on 'Painel'
    click_on 'Editar perfil'
    fill_in 'Nome completo', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Nome completo não pode ficar em branco')
  end
end