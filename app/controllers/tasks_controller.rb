class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end  
  end

  def new
    @task = Task.new
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description]
    )
      redirect_to task_path 
      return
    else 
      render :new
      return
    end
  end

  def edit
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end  
  end

  def destroy
  end

  def create
    @task = Task.new(
      name: params[:task][:name], 
      description: params[:task][:description])

    if @task.save
      redirect_to @task
    else
      render :new, :bad_request
    end
  end

end
