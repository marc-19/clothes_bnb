class ReviewsController < ApplicationController
  before_action :set_booking, only: [:create]

  def create
    @review = Review.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to item_path(@booking.item), notice: 'Review successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
