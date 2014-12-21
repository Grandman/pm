class RenameLoginToEmail < ActiveRecord::Migration
  def change
    rename_column :users, :login, :email     
  end
end
