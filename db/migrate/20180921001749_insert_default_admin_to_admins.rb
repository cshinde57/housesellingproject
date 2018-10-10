class InsertDefaultAdminToAdmins < ActiveRecord::Migration[5.1]
  def change
    Admin.create :name => "admin", :email => "admin@ncsu.edu", :password => "admin"
  end
end
