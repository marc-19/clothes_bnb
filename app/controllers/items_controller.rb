class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:create]
  before_action :set_item, only: [:show, :destroy]

  def index
    @items = Item.all
    if params.dig(:search, :search).present?
      @items = @items.where("title ILIKE ? OR description ILIKE ?", "%#{params[:search][:search]}%", "%#{params[:search][:search]}%")
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to dashboard_user_path(current_user), notice: "Item deleted successfully."
    else
      redirect_to dashboard_user_path(current_user), alert: "Item could not be deleted."
    end
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @reviews = @item.reviews.order(created_at: :desc)
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
    params.require(:item).permit(:category, :size, :condition, :price_per_day, :description, :title, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
