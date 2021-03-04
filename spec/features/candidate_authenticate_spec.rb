require 'rails_helper'

feature 'Candidate' do
  scenario 'sign up successfully' do

    visit root_path
    click_on("Candidato", :match => :first)
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
  
  scenario 'sign up and fields cannot be blank' do

    visit root_path
    click_on("Candidato", :match => :first)
    click_on 'Sign up'
    
    within('form') do
      click_on 'Sign up'
    end  
    
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Senha não pode ficar em branco'
    expect(page).to have_content 'Nome completo não pode ficar em branco'
  end

  scenario 'log in successfully' do
    Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')
    
    visit root_path
    click_on("Candidato", :match => :first)
    
    within('form') do
      fill_in 'E-mail', with: 'cris@gmail.com' 
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end  
    
    
    expect(page).to have_content 'Login efetuado com sucesso.'
    expect(page).to have_content 'Painel do Candidato'
  end
  
  scenario 'log out' do
    Candidate.create!(email: 'cris@gmail.com', password: '123456', full_name: 'Cris Saito')

    visit root_path
    click_on("Candidato", :match => :first)

    within('form') do
      fill_in 'E-mail', with: 'cris@gmail.com' 
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end  
    
    click_on 'Sair'

    expect(current_path).to eq root_path
    within('nav') do
      expect(page).not_to have_link 'Sair'
      expect(page).not_to have_content 'cris@gmail.com'
      expect(page).to have_link 'Candidato'
    end
  end
end
