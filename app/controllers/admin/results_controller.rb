require 'ostruct'

module Admin
  class ResultsController < Admin::ApplicationController
    def show
      @results = OpenStruct.new(
        voting: Voting.find(params[:id]),
        items: Item.for_results(params[:id]),
        scheduled: Result.where(voting_id: params[:id]).order('scheduled_on ASC')
      )
    end

    def update
      item = Item.find(params[:id])
      voting = item.voting

      @result = Result.find_or_create_by(item: item, voting: voting, total_votes: item.cached_votes_score)
      @result.find_date(params[:day])
      @result.save
    end
  end
end
