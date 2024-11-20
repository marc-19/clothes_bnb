class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:create]

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id

    if @item.save
      redirect_to root_path, notice: "Item successfully created!"
    else
      render :new, alert: "Failed to create item. Please check the form again."
    end
  end

  private

  # Strong Parameters to permit only the necessary fields
  def item_params
    params.require(:item).permit(:category, :size, :condition, :price_per_day, :description, :title)
  end

end
