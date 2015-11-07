class Result < ActiveRecord::Base
  belongs_to :item
  belongs_to :voting
end
