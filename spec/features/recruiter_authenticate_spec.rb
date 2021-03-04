require 'rails_helper'

feature 'Recruiter' do
  scenario 'sign up successfully as admin' do

    visit root_path
    click_on("Recrutador", :match => :first)
    click_on 'Sign up'

    within('form') do
      fill_in 'E-mail', with: 'cris@cocacola.com.br' 
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Sign up'
    end  

    expect(Recruiter.last.admin?). to be_truthy
    expect(page).to have_content 'Cadastrar Empresa'
  end

  scenario 'sign up successfully as member' do
    coca = Company.create!(name: 'Cocacola', id: 5)
    Recruiter.create!(email: 'ana@cocacola.com', password: '123456', company: coca)

    visit root_path
    click_on("Recrutador", :match => :first)
    click_on 'Sign up'

    within('form') do
      fill_in 'E-mail', with: 'kratos@cocacola.com' 
      fill_in 'Senha', with: '123456'
      fill_in 'Confirme sua senha', with: '123456'
      click_on 'Sign up'
    end  

    expect(Recruiter.last.member?). to be_truthy
    expect(page).to have_content 'Cocacola'
    expect(page).to have_link 'Voltar'
  end

  scenario 'sign up and fields cannot be blank' do

    visit root_path
    click_on("Recrutador", :match => :first)
    click_on 'Sign up'
    
    within('form') do
      click_on 'Sign up'
    end  
    
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Senha não pode ficar em branco'
  end

  scenario 'log in successfully as recruiter' do
    Recruiter.create!(email: 'saito@cocacola.com', password: '123456')

    visit root_path
    click_on("Recrutador", :match => :first)

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

  scenario 'log out' do
    recruiter = Recruiter.create!(email: 'saito@cocacola.com', password: '123456')

    visit root_path
    click_on("Recrutador", :match => :first)

    within('form') do
      fill_in 'E-mail', with: 'saito@cocacola.com' 
      fill_in 'Senha', with: '123456'
      click_on 'Log in'
    end  
    
    click_on 'Sair'

    expect(current_path).to eq root_path
    within('nav') do
      expect(page).not_to have_link 'Sair'
      expect(page).not_to have_content recruiter.email
      expect(page).to have_link 'Recrutador'
    end
  end
end
