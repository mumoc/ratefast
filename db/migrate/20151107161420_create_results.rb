class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :item_id
      t.integer :voting_id
      t.date :scheduled_on
      t.integer :total_votes

      t.timestamps null: false
    end
  end
end
