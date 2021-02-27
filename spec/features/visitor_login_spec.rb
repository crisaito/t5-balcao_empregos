require 'rails_helper'

feature 'Visitor' do
  scenario 'sign up successfully as recruiter for the first time' do

    visit root_path
    click_on 'Recrutador'
    click_on 'Sign up'

    within('form') do
      fill_in 'E-mail', with: 'cris@cocacola.com.br' 
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Sign up'
    end  

    expect(page).to have_content 'Cadastrar Empresa'
  end

  scenario 'log in successfully as recruiter' do
    Recruiter.create!(email: 'saito@cocacola.com', password: '123456')

    visit root_path
    click_on 'Recrutador'

    within('form') do
      fill_in 'E-mail', with: 'saito@cocacola.com' 
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end  

    expect(page).to have_content 'saito@cocacola.com'
    expect(page).to have_content 'Empresa: Cocacola'
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).to have_content 'Sair'
    expect(page).not_to have_link 'Recrutador'
    expect(page).to have_content 'Descrição'
    expect(page).to have_content 'Endereço'
  end

  scenario 'sign up successfully as candidate' do

    visit root_path
    click_on 'Candidato'
    click_on 'Sign up'
    
    within('form') do
      fill_in 'E-mail', with: 'cris@gmail.com' 
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      fill_in 'Nome completo', with: 'Cris Saito' 
      fill_in 'Tel', with: '99 999 999' 
      fill_in 'Cidade', with: 'São Paulo' 
      fill_in 'Estado', with: 'SP' 
      fill_in 'Bio', with: 'Graduação em Design' 
      click_on 'Sign up'
    end
  
    expect(page).to have_content 'Bem vindo! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'Painel do Candidato'
  end
end
