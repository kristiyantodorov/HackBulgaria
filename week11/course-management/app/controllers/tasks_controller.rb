class TasksController < ApplicationController
  def index
    @tasks = lecture.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = lecture.tasks.new(task_params)

    if @task.save
      redirect_to lecture_tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = lecture.tasks.find(params[:id])
  end

  def update
    @task = lecture.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to lecture_tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:lecture_id])
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:lecture_id, :name, :description)
  end

  helper_method
  def lecture
    @lecture = Lecture.find(params[:lecture_id])
  end
end
