class RegistrationsController < ApplicationController
  before_action :set_lecture, only: [:new, :create]

  def new
    @registration = Registration.new
    authorize @registration
  end

  def create
    @registration = Registration.new(registration_params)
    @registration.lecture = @lecture
    @registration.user = current_user
    authorize @registration

    if @registration.save
      flash[:notice] = "You have sucessfully registered to #{@lecture.name}"
      redirect_to lectures_path
    else
      flash[:alert] = @registration.errors.full_messages.first
      redirect_to lectures_path
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    authorize @registration

    @registration.destroy
    redirect_to lectures_path
  end

  private

  def set_lecture
    @lecture = Lecture.find(params[:lecture_id])
  end

  def registration_params
    params.require(:registration).permit(:role)
  end
end
