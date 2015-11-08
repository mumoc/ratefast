class DashboardController < ApplicationController
  before_action :find_items, only: :index

  def index
  end

  private
  def find_items
    @items = [1, 2, 3, 4, 5]
  end
end
