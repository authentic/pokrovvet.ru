class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.integer :public_user_id

      t.timestamps
    end
    add_index :microposts, :public_user_id
  end
end
