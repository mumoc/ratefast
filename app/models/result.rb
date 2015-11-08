class Result < ActiveRecord::Base
  belongs_to :item
  belongs_to :voting

  validates_uniqueness_of :item_id, scope: :voting_id
  validate :only_five_per_voting, on: :create

  def self.update_results_date(indexes)
    indexes.each do |i|
      return unless i[0] =~ /^[0-9]+$/
      result = Result.find(i[0])
      result.update_attribute(:scheduled_on, find_date(i[1]))
    end
  end

  def self.find_date(index)
    date  = Date.parse(day(index))
    delta = date > Date.today ? 0 : 7
    date + delta
  end

  def self.by_voting(voting_id)
    Result.where(voting_id:  voting_id).order('scheduled_on ASC')
  end

  def self.day(index)
    %w{Monday Tuesday Wednesday Thursday Friday}[index.to_i]
  end

  private

  def only_five_per_voting
    results = Result.where(voting_id: voting_id).count

    if results == 5
      errors.add(:voting, 'you cannot add more than 5 results per voting')
    end
  end
end
