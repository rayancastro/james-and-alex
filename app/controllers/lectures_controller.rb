class LecturesController < ApplicationController
  def new
    @lecture = Lecture.new
    authorize @lecture
  end

  def create
    @lecture = Lecture.new(lecture_params)
    authorize @lecture

    if @lecture.save
      redirect_to lectures_path
    else
      flash[:alert] = Rails.env.development? ? @lecture.errors.full_messages : "Lecture could not be created"
      render :new
    end
  end

  private

  def lecture_params
    params.require(:lecture).permit(:name, :description, :teachers, :start_date, :duration, :location, :max_students, :status)
  end
end
