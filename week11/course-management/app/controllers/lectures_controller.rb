class LecturesController < ApplicationController
  def index
    @lectures = Lecture.all
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      redirect_to lectures_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @lecture = Lecture.find(params[:id])
  end

  def destroy
    Lecture.destroy(params[:id])
    redirect_to lectures_path
  end

  private
  def lecture_params
    params.require(:lecture).permit(:id, :name, :text)
  end
end
