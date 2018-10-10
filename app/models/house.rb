class House < ApplicationRecord
  validates :location, presence: true
  validates :square_footage, presence: true
  validates :year_built, presence: true
  validates :style, presence: true
  validates :price, presence: true
  validates :number_of_floors, presence: true
  validates :current_house_owner, presence: true
  validates :contact_info_of_realtor, presence: true
  mount_uploader :file_name, ImageUploader
  has_many :interest_list, dependent: :destroy
  has_many :inquiry, dependent: :destroy

end
