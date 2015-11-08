require 'ostruct'

module Admin
  class ResultsController < Admin::ApplicationController
    def show
      @results = OpenStruct.new(
        voting: Voting.find(params[:id]),
        items: Item.most_voted(params[:id]),
        ready_to_schedule: Result.by_voting(params[:id])
      )

      @results.items -= @results.ready_to_schedule.map(&:item)
    end

    def create
      item = Item.find(params[:result][:item_id])
      @result = Result.create(item: item, voting: item.voting, total_votes: item.cached_votes_score)

      if @result.persisted?
        render json: { result: @result, item: @result.item }
      else
        render json: { message: 'Results are full of items' }, status: :unprocessable_entity
      end
    end

    def update
      @results = Result.update_results_date(params[:result][:days])

      render json: { data: @results }
    end

    def destroy
      @result = Result.find(params[:id])
      @result.destroy

      redirect_to admin_result_path(@result.voting_id)
    end
  end
end
