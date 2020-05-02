class TasksController < ApplicationController
  # shows list of tasks
  def index
    @tasks = Task.all.sort
  end

  # shows individual task details
  def show
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end

  # creates a form
  def new 
    @task = Task.new
  end
  
  # form submit button calls this
  def create

    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )
    if @task.save
      redirect_to "#{tasks_path}/#{@task.id}"
      return
    else
      render :new
      return
    end

  end
  
end
