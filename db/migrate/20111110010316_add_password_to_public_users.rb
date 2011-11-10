class AddPasswordToPublicUsers < ActiveRecord::Migration
  def change
    add_column :public_users, :encrypted_password, :string
  end
end
