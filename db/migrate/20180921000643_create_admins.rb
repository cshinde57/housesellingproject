class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.column :email, :string, :null => false
      t.column :name,:string, :null => false
      t.column :password, :string ,:null => false
      t.timestamps
    end
  end


end
