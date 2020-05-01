class TasksController < ApplicationController
  def index # index means list all
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head :not_found
      return
    end
  end

  def update
  end

  def edit
  end

  def destory
  end

  def new
  end

  def create
  end
end
