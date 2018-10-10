class RealEstateCompany < ApplicationRecord
  validates :company_name, uniqueness:  true, presence: true
  validates :website, presence: true
  validates :address,  presence: true
  validates :size_of_company,   presence: true
  validates :founded_year,   presence: true
  validates :revenue,   presence: true
  validates :synopsis,   presence: true
  has_many :realtor, dependent: :destroy
  has_many :house, dependent: :destroy
end
