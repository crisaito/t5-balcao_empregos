class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company, optional: true
  
  before_save :generate_company

  enum role: { admin: 0, member: 1 }

  def generate_company
    self.company_name = self.email[/(?<=\@)(.*?)(?=\.)/].capitalize

    if Company.find_by(name: self.company_name).nil?
      company = Company.create!(name: self.company_name)
      self.admin!
      self.company_id = company.id
    elsif Company.find_by(name: self.company_name).valid?
      self.company_id = Company.find_by(name: self.company_name).id
    else
      Company.create!(name: self.company_name)
      self.admin!
    end
  end
end
