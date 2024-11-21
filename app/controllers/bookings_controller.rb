class BookingsController < ApplicationController
  before_action :authenticate_user!
  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = @item

    if valid_dates? && @booking.save
      redirect_to dashboard_user_path(current_user), notice: "Your rental has been successfully booked!"
    else
      redirect_to item_path(@item), alert: "Failed to rent item! Please check your input."
    end
  end

  private 
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

  def valid_dates?
    if @booking.start_date.blank? || @booking.end_date.blank?
      false
    elsif @booking.start_date < Date.today
      false
    elsif @booking.start_date >= @booking.end_date
      false
    else
      true
    end
  end
end
