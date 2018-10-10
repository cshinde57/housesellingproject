class Inquiry < ApplicationRecord
  validates :subject, presence: true
  validates :message_content,  presence: true
  has_many :reply_to_inquiry, dependent: :destroy
end
