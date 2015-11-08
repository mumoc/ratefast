class AddDefaultValuesForSpecialAndFixed < ActiveRecord::Migration
  def change
    change_column :items, :special, :boolean, default: false
    change_column :items, :fixed, :boolean, default: false
  end
end
