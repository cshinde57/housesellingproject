class CreateRealEstateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :real_estate_companies do |t|
      t.column :company_name, :string, :null => false , :presence => true
      t.column :website,:string, :null => false , :presence => true
      t.column :address, :string, :null => false , :presence => true
      t.column :size_of_company, :string, :null => false , :presence => true
      t.column :founded_year,:string, :null => false , :presence => true
      t.column :revenue,:string, :null => false , :presence => true
      t.column :synopsis,:string, :null => false , :presence => true
      t.timestamps
    end
  end
end
