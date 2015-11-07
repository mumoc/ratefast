module Admin
  class VotingsController < ApplicationController
    include VotingsHelper

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

      if @voting.save
        redirect_to admin_votings_path
      end
    end

    def edit
      build_items
    end

    def update
      @voting.update_attributes voting_params

      if event_params.present?
        @voting.send "#{event_params}!".to_sym

        render json: {
          status: @voting.status,
          next_status: next_event(@voting.status),
          btn_text: change_event_btn_text(@voting.status)
        }
      else
        @voting.update_attributes voting_params

        if @voting.save
          redirect_to admin_votings_path
        end
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

    def event_params
      params[:voting][:event]
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
