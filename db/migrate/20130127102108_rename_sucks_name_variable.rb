class RenameSucksNameVariable < ActiveRecord::Migration
  def up
    rename_column :users, :lastName, :last_name
    rename_column :users, :confirmPassword, :confirmation_password
    

  end

  def down
    rename_column :users, :last_name, :lastName 
    rename_column :users, :confirmation_password, :confirmPassword
  end
end
