class ItemsController < ApplicationController
  def index
    @items = Item.all
    if params.dig(:search, :search).present?
      @items = @items.where("title ILIKE ? OR description ILIKE ?", "%#{params[:search][:search]}%", "%#{params[:search][:search]}%")
    end
  end
end
