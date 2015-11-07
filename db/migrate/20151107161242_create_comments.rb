class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :item_id
      t.text :body
      t.integer :rate

      t.timestamps null: false
    end
  end
end
