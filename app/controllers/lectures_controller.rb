class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]
  def index
    @lectures = policy_scope(Lecture)
  end

  def show
    authorize @lecture
  end

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

  def edit
    authorize @lecture
  end

  def update
    authorize @lecture

    if @lecture.update(lecture_params)
      redirect_to lectures_path
    else
      flash[:alert] = Rails.env.development? ? @lecture.errors.full_messages : "Lecture could not be created"
      render :edit
    end
  end


  private

  def set_lecture
    @lecture = Lecture.find(params[:id])
  end

  def lecture_params
    params.require(:lecture).permit(:name, :description, :teachers, :start_date, :duration, :location, :max_students, :status)
  end
end
