class Voting < ActiveRecord::Base
  include AASM

  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, reject_if: proc { |items| items['title'].blank? }, allow_destroy: true

  aasm column: :status do
    state :open, initial: true
    state :voting
    state :reviewing
    state :published

    event :vote do
      transitions from: :open, to: :voting
    end

    event :close, after_commit: :create_results do
      transitions from: :voting, to: :reviewing
    end

    event :publish do
      transitions from: :reviewing, to: :published
    end

    event :reopen do
      transitions to: :open
    end
  end

  def self.last_published
    where(status: 'published').order(updated_at: :asc).last
  end

  def self.under_review
    where(status: 'reviewing').order(updated_at: :asc).last
  end

  def self.current
    where(status: [:open, :voting]).last
  end

  def create_results
    fixed_items.each do |item|
      Result.create(item: item, voting: self)
    end
  end

  def fixed_items
    self.items.select { |item| item.fixed || item.special }
  end

  def my_items(user_id)
    self.items.select do
      |item| item.user_id == user_id && item.persisted?
    end
  end

  def in_review_or_published?
    self.reviewing? || self.published?
  end
end
