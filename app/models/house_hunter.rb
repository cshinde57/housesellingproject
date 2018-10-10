class HouseHunter < ApplicationRecord
  validates :email, uniqueness:  true, presence: true
  validates :name, presence: true
  validates :phone,  presence: true
  validates :password,   presence: true
  validates :contact_method,   presence: true
  validates :secret_question,   presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :interest_lists, dependent: :destroy
  has_many :inquiry, dependent: :destroy
end
