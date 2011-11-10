class AddSaltToPublicUsers < ActiveRecord::Migration
  def change
    add_column :public_users, :salt, :string
  end
end
