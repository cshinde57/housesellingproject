class CreateRealtors < ActiveRecord::Migration[5.1]
  def change
    create_table :realtors do |t|
      t.column :email, :string, :null => false , :presence => true
      t.column :password, :string, :null => false , :presence => true
      t.column :name, :string, :null => false , :presence => true
      t.column :phone, :string, :null => false , :presence => true
      t.column :secret_question, :string, :null => false , :presence => true
      t.belongs_to :real_estate_company, foreign_key: true
      t.timestamps
    end
  end
end
