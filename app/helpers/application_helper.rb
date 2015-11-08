module ApplicationHelper
  def voting_title(voting)
    title = voting && voting.title || 'Voting'
    title.titleize
  end

  def is_dashboard?
    controller.controller_name == 'dashboard'
  end

  def day_name(item)
    item.scheduled_on && I18n.l(item.scheduled_on, format: :weekday)
  end
end
