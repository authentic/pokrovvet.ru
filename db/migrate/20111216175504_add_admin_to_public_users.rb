class AddAdminToPublicUsers < ActiveRecord::Migration
  def change
    add_column :public_users, :admin, :boolean, :default => false
  end
end
