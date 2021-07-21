class ItemsController < ApplicationController

  def index
    if params[:user_id]
      user=User.find(params[:user_id])
      items=user.items
    else
    items = Item.all
    end
    render json: items, include: :user
  rescue ActiveRecord::RecordNotFound=>not_found
    render json: {errors:invalid.record.errors},status: :not_found
  end

end
