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

    event :close do
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

  def self.current
    where(status: [:open, :voting]).last
  end
end
