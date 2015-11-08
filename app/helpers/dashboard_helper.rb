module DashboardHelper
  def item_image(item)
    item.image && item.image_url
  end
end
