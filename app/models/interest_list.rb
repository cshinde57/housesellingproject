class InterestList < ApplicationRecord
  validates :house_id, uniqueness: { scope: [:house_hunter_id] }
end
