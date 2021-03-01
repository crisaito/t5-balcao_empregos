require 'rails_helper'

describe Recruiter do
  context 'validation' do
    it 'first recruiter sign up is set as admin' do
      recruiter = Recruiter.create!(email: 'ana@cocacola.com', password: '123456')
      recruiter2 = Recruiter.create!(email: 'bia@cocacola.com', password: '123456')
      recruiter3 = Recruiter.create!(email: 'clo@pepsi.com', password: '123456')
      
      expect(recruiter.admin?).to eq true
      expect(recruiter2.admin?).to eq false
      expect(recruiter2.member?).to eq true
      expect(recruiter3.admin?).to eq true

    end
  end
end