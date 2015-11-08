module Admin
  class ResultsController < Admin::ApplicationController
    def show
      @items = Item.for_results(params[:id])
    end
  end
end
