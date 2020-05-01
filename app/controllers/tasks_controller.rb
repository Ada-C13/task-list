class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end
end
