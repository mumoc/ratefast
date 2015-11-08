class Item < ActiveRecord::Base
  acts_as_votable

  has_many   :comments
  has_one    :image
  belongs_to :user
  belongs_to :voting
  has_one    :result

  delegate :url, to: :image, prefix: true, allow_nil: true
  delegate :scheduled_on, to: :result

  def self.fixed(voting_id)
    Item.where(voting_id: voting_id, fixed: true)
  end

  def self.special(voting_id)
    Item.where(voting_id: voting_id, special: true)
  end

  def self.most_voted(voting_id)
    Item.where(voting_id: voting_id, fixed: false, special: false).order('cached_votes_score DESC')
  end
end
