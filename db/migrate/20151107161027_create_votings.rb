class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.string :title
      t.string :status

      t.timestamps null: false
    end
  end
end
