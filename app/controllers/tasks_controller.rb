# TASKS = [
#   {task_name: "Grocery shopping"},
#   {task_name: "cooking"},
#   {task_name: "water flowers"},
# ]


class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find_by(id: params[:id])
    # @task = Task.find(params[:id])
    @task = Task.find_by(id: params[:id])
    # task_id = params[:id]
    # @task = Task.find_by(id: task_id)
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end
end
