class Company < ApplicationRecord
  has_many :recruiters
  has_many :jobs
  has_one_attached :logo

end
