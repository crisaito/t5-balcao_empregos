require 'rails_helper'

describe Company do
  context 'validation' do
    it 'company name eq to domain email address' do
      recruiter = Recruiter.create!(email: 'saito@cocacola.com', password: '123456')
      
      expect(recruiter.company_name).to eq 'Cocacola'

    end

    it 'company name from recruiter creates new company' do
      recruiter = Recruiter.create!(email: 'saito@cocacola.com', password: '123456')

      expect(Company.last.name).to eq 'Cocacola'
      expect(Company.last.id).to eq recruiter.company_id

    end

    it 'company name from recruiter eq name from company in database' do
      company = Company.create!(id: 11, name: 'Cocacola')
      recruiter = Recruiter.create!(email: 'saito@cocacola.com', password: '123456')

      expect(recruiter.company_id).to eq 11

    end
  end
end