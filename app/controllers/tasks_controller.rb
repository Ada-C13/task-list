class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    redirect_to tasks_path if @task.nil?
  end
  
  def new
    @task = Task.new
  end

  def create 
    form = params["task"]
    @new_task = Task.new

    @new_task.name = form["name"]
    @new_task.description = form["description"]

    redirect_to task_path(@new_task.id) if @new_task.save

  end

  def edit
    @task = Task.find_by(id: params[:id])
    redirect_to tasks_path if @task.nil?
  end

  def update
    task = Task.find_by(id: params[:id])

    if task.nil?
      redirect_to root_path
    elsif task.update(task_params)
      redirect_to task_path(task.id)
    else
      render new_task_path
    end
  end



  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed)
  end
  
end
