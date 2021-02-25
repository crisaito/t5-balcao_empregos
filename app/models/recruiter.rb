class Recruiter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company, optional: true
  
  before_save :company_name

  def company_name
    self.company_name = self.email[/(?<=\@)(.*?)(?=\.)/].capitalize
  end
  
end
