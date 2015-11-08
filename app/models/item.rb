class Item < ActiveRecord::Base
  acts_as_votable

  has_many   :comments
  has_one    :image
  belongs_to :user
  belongs_to :voting
  has_one    :result

  delegate :url, to: :image, prefix: true
  delegate :scheduled_on, to: :result

  def self.fixed(voting_id)
    Item.where(voting_id: voting_id, fixed: true)
  end

  def self.special(voting_id)
    Item.where(voting_id: voting_id, special: true)
  end

  def self.most_voted(voting_id)
    Item.where(voting_id: voting_id, fixed: nil, special: nil).order('cached_votes_score DESC')
  end

  def self.for_results(voting_id)
    fixed(voting_id) + special(voting_id) + most_voted(voting_id)
  end
end
