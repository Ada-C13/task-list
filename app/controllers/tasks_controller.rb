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
end
