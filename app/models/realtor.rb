class Realtor < ApplicationRecord
  validates :email, uniqueness:  true, presence: true
  validates :name, presence: true
  validates :phone,  presence: true
  validates :password,   presence: true
  validates :secret_question,   presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
