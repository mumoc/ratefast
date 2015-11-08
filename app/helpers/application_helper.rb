module ApplicationHelper
  def voting_title(voting)
    title = voting && voting.title || 'Voting'
    title.titleize
  end

  def is_dashboard?
    controller.controller_name == 'dashboard'
  end

  def day_name(index)
    %w{Monday Tuesday Wednesday Thursday Friday}[index]
  end

  def item_image_url(item)
    item.image_url || image_url('default.png')
  end

  def is_today?(index)
    today == day_name(index)
  end

  def today
    Time.current.strftime("%A")
  end
end
