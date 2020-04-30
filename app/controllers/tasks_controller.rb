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

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )

    if @task.save
      redirect_to task_path(id: @task.id)
    else
      render :new, :bad_request
      return 
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
