class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end
  def rent
    start_date = params[:start_date]
    end_date = params[:end_date]
  end
end
