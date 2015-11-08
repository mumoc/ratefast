class DashboardController < ApplicationController
  before_action :find_current_voting, :find_last_voting, :find_items, only: :index

  def index
  end

  private
  def find_current_voting
    @current_voting = Voting.where(status: [:open, :voting]).last
  end

  def find_last_voting
    @last_voting = Voting.last_published
  end

  def find_items
    @items = @last_voting && @last_voting.items.first(5)
  end
end
