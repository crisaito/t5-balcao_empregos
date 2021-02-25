require 'rails_helper'

feature 'Visitor login' do
  scenario 'successfully as recruiter' do
    recruiter = Recruiter.create!(email: 'saito@cocacola.com', password: '123456')

    visit root_path
    click_on 'Entrar'

    within('form') do
      fill_in 'E-mail', with: recruiter.email 
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end  

    expect(page).to have_content recruiter.email
    expect(page).to have_content 'Empresa: Cocacola'
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).to have_content 'Sair'
    expect(page).not_to have_link 'Entrar'
  end

  scenario 'sign up successfully as recruiter for the first time' do

    visit root_path
    click_on 'Entrar'
    click_on 'Sign up'

    within('form') do
      fill_in 'E-mail', with: 'cris@cocacola.com.br' 
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Sign up'
    end  

    expect(page).to have_content 'Cadastrar Empresa'
  end
end