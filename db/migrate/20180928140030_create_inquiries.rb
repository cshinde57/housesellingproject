class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.column :subject, :string, :null => false , :presence => true
      t.column :message_content, :string, :null => false , :presence => true
      t.belongs_to :house_hunter, foreign_key: true
      t.belongs_to :house, foreign_key: true
      t.timestamps
    end
  end
end
