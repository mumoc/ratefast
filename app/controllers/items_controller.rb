class ItemsController < ApplicationController
  def update
    @item = Item.find(params[:id])
    vote

    render nothing: true
  end

  private

  def vote
    if params[:item][:vote].to_i > 0
      @item.liked_by current_user
    else
      @item.disliked_by current_user
    end
  end
end
