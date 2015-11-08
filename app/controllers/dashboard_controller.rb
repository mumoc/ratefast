class DashboardController < ApplicationController
  before_action :find_current_voting, :find_last_voting, :find_items, only: :index

  def index
  end

  private
  def find_current_voting
    @current_voting = Voting.current
  end

  def find_last_voting
    @last_voting = Voting.last_published
  end

  def find_items
    @items = @last_voting && Item.for_results(@last_voting.id).first(5)
  end
end
