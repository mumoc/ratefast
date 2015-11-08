class Result < ActiveRecord::Base
  belongs_to :item
  belongs_to :voting

  validates_uniqueness_of :scheduled_on


  def find_date(day)
    date  = Date.parse(day)
    delta = date > Date.today ? 0 : 7
    schedule_date = date + delta

    remove_scheduled_item(schedule_date)

    self.scheduled_on = schedule_date
    self
  end

  def remove_scheduled_item(schedule_date)
    item = Result.find_by(scheduled_on: schedule_date)
    item.update_column(:scheduled_on, nil) if item
  end

  def self.scheduled(result_id)
    Result.where('voting_id = ? AND scheduled_on IS NOT NULL', result_id).order('scheduled_on ASC')
  end
end
