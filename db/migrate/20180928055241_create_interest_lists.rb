class CreateInterestLists < ActiveRecord::Migration[5.1]
  def change
    create_table :interest_lists do |t|
      t.belongs_to :house_hunter, foreign_key: true
      t.belongs_to :house, foreign_key: true
      t.timestamps
    end
  end
end
