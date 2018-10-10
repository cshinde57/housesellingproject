class CreateHouseHunters < ActiveRecord::Migration[5.1]
  def change
    create_table :house_hunters do |t|
      t.column :email, :string, :null => false , :presence => true
      t.column :password, :string, :null => false , :presence => true
      t.column :name, :string, :null => false , :presence => true
      t.column :phone, :string, :null => false , :presence => true
      t.column :contact_method, :string, :null => false , :presence => true
      t.column :secret_question, :string, :null => false , :presence => true
      t.timestamps
    end
  end
end
