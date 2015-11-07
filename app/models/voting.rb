class Voting < ActiveRecord::Base
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, reject_if: proc { |items| items['title'].blank? }, allow_destroy: true
end
