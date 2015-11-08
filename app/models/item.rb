class Item < ActiveRecord::Base
  acts_as_votable

  has_many   :comments
  has_one    :image
  belongs_to :user
  belongs_to :voting
end
