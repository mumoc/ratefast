class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :voting_id
      t.string :title
      t.boolean :special
      t.boolean :fixed
      t.string :birthday_name
      t.integer :image_id

      t.timestamps null: false
    end
  end
end
