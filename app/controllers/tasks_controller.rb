class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at],
    )

    if @task.save
      redirect_to task_path(@task.id)
      return
    else
      render :new
      return
    end
  end
end
