class AddEmailUniquenessIndex < ActiveRecord::Migration
  def up
    add_index :public_users, :email, :unique=>true
  end

  def down
    remove_index :public_users, :email
  end
end
