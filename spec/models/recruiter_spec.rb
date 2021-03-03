require 'rails_helper'

describe Recruiter do
  context '#generate_company' do
    it 'first recruiter sign up is set as admin' do
      recruiter = Recruiter.create!(email: 'ana@cocacola.com', password: '123456')
      recruiter2 = Recruiter.create!(email: 'bia@cocacola.com', password: '123456')
      recruiter3 = Recruiter.create!(email: 'clo@pepsi.com', password: '123456')
      
      expect(recruiter.admin?).to eq true
      expect(recruiter2.admin?).to eq false
      expect(recruiter3.admin?).to eq true
    end

    it 'successive recruiters sign up are set as member' do
      recruiter = Recruiter.create!(email: 'ana@cocacola.com', password: '123456')
      recruiter2 = Recruiter.create!(email: 'bia@cocacola.com', password: '123456')
      recruiter3 = Recruiter.create!(email: 'clo@cocacola.com', password: '123456')
      
      expect(recruiter.member?).to eq false
      expect(recruiter2.member?).to eq true
      expect(recruiter3.member?).to eq true
      expect(recruiter.company_id).to eq 1
      expect(recruiter2.company_id).to eq 1
      expect(recruiter3.company_id).to eq 1
    end    
  end
end