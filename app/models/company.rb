class Company < ApplicationRecord
  has_many :recruiters
  has_one_attached :logo
  
  validates :cnpj, uniqueness: true

end
