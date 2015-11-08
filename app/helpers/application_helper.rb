module ApplicationHelper
  def voting_title(voting)
    title = voting && voting.title || 'Voting'
    title.titleize
  end

  def is_dashboard?
    controller.controller_name == 'dashboard'
  end
end
