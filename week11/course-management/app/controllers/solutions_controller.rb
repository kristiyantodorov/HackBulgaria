class SolutionsController < ApplicationController
  def new
    @solution = Solution.new
  end

  def index
    @solutions = task.solutions.all
  end

  def create
    @solution = task.solutions.new(solution_params)

    if @solution.save
      redirect_to lecture_task_solutions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @solution = task.solutions.find(params[:id])
  end

  def destroy
    @solution = task.solutions.find(params[:id])
    @solution.destroy!
    redirect_to lecture_task_solutions_path(params[:lecture_id], params[:task_id])
  end

  private
  def task
    @task = Lecture.find(params[:lecture_id]).tasks.find(params[:task_id])
  end

  def solution_params
    params.require(:solution).permit(:text)
  end
end
