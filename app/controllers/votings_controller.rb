class VotingsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_voting, only: [:show, :update]

  def index
    @votings = Voting.all
  end

  def show
    build_items if @voting.open?
  end

  def update
    @voting.update_attributes! voting_params
    redirect_to voting_path(@voting)
  end

  private

  def voting_params
    params.require(:voting).permit(:title, items_attributes: items_attributes)
  end

  def results_params
    params[:results]
  end

  def items_attributes
    %w{ id title fixed special birthday_name user_id _destroy }
  end

  def find_voting
    @voting = Voting.find(params[:id])
  end

  def build_items
    items_for_voting = 2 - @voting.items.where(user_id: current_user.id).count

    @items = items_for_voting.times do
      @voting.items.build(user_id: current_user.id)
    end
  end
end
