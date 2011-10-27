class CreatePublicUsers < ActiveRecord::Migration
  def change
    create_table :public_users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
