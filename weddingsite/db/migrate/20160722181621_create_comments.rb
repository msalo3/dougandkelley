class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.timestamps null: false
      t.integer :user_id
    end
    add_index :comments, :user_id
  end
end
