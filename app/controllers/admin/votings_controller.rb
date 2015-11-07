module Admin
  class VotingsController < ApplicationController
    before_filter :authenticate_user!
    before_action :check_for_admin_user

    def index
      @votings = Voting.all
    end

    def new
      @voting = Voting.new

      5.times do
        @voting.items.build(user_id: current_user.id)
      end
    end

    def create
      @voting = Voting.new voting_params
      @voting.status = 'open'

      if @voting.save
        redirect_to admin_votings_path
      end
    end

    def edit
      @voting = Voting.find(params[:id])

      (5 - @voting.items.count).times do
        @voting.items.build(user_id: current_user.id)
      end
    end

    def update
      @voting = Voting.find(params[:id])

      @voting.update_attributes voting_params

      if @voting.save
        redirect_to admin_votings_path
      end
    end

    def destroy
      @voting = Voting.find(params[:id])

      if @voting.destroy
        redirect_to admin_votings_path
      end
    end

    private

    def voting_params
      params.require(:voting).permit(:title, items_attributes: [:id, :title, :fixed, :special, :birthday_name, :user_id, :_destroy])
    end

    def check_for_admin_user
      render nothing: true unless current_user.admin
    end
  end
end
