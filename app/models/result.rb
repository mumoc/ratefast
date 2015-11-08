class Result < ActiveRecord::Base
  belongs_to :item
  belongs_to :voting

  def find_date(day)
    date  = Date.parse(day)
    delta = date > Date.today ? 0 : 7
    self.scheduled_on = date + delta
    self
  end
end
