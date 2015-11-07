class AddIndexes < ActiveRecord::Migration
  def change
    # Items Model
    add_index 'items', :user_id
    add_index 'items', :voting_id
    add_index 'items', :image_id

    # Result Model
    add_index 'results', :item_id
    add_index 'results', :voting_id

    # Comment Model
    add_index 'comments', :user_id
    add_index 'comments', :item_id

    # Image Model
    add_index 'images', :item_id
  end
end
