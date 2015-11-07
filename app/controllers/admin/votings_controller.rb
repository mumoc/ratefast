module Admin
  class VotingsController < ApplicationController
    before_filter :authenticate_user!
    before_action :check_for_admin_user
    before_action :find_voting, only: [:edit, :update, :destroy]

    def index
      @votings = Voting.all
    end

    def new
      @voting = Voting.new
      build_items
    end

    def create
      @voting = Voting.new voting_params
      @voting.status = 'open'

      if @voting.save
        redirect_to admin_votings_path
      end
    end

    def edit
      build_items
    end

    def update
      @voting.update_attributes voting_params

      if @voting.save
        redirect_to admin_votings_path
      end
    end

    def destroy
      if @voting.destroy
        redirect_to admin_votings_path
      end
    end

    private

    def find_voting
      @voting = Voting.find(params[:id])
    end

    def voting_params
      params.require(:voting).permit(:title, items_attributes: items_attributes)
    end

    def check_for_admin_user
      render nothing: true unless current_user.admin
    end

    def build_items
      (5 - @voting.items.count).times do
        @voting.items.build(user_id: current_user.id)
      end
    end

    def items_attributes
      %w{ id title fixed special birthday_name user_id _destroy }
    end
  end
end
