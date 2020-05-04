class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    redirect_to tasks_path if @task.nil?
  end
end
