class BookingsController < ApplicationController
  before_action :set_lecture, only: [:new, :create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.lecture = @lecture
    @booking.user = current_user
    authorize @booking

    if @booking.save
      flash[:notice] = "You have sucessfully registered to #{@lecture.name}"
      redirect_to lectures_path
    else
      flash[:alert] = @booking.errors.full_messages.first
      redirect_to lectures_path
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking

    @booking.destroy
    redirect_to lectures_path
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end

  def booking_params
    params.require(:booking).permit(:role)
  end
end
