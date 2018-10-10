class Admin < ApplicationRecord
  validates :email, uniqueness: true
  validates :name, presence: true
end
