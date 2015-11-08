module ApplicationHelper
  def voting_title(voting)
    under_review = Voting.under_review.try(:status) || 'Voting'
    title = voting && voting.title || under_review
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
