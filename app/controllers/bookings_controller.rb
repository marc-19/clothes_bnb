class BookingsController < ApplicationController
  before_action :authenticate_user!
  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = @item

    if @booking.save
      redirect_to item_path(@item), notice: "Your rental has been successfully booked!"
    else
      redirect_to item_path(@item), alert: "Failed to rent item! Please check your input."
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end
end
