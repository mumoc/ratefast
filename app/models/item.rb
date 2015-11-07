class Item < ActiveRecord::Base
  has_many   :comments
  has_one    :image
  belongs_to :user
  belongs_to :voting
end
