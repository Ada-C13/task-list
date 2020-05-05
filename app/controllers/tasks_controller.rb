class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end 

  def show
    task_id = params[:id].to_i 
    @task = Task.find_by(id: task_id) 

    if @task.nil?
      redirect_to root_path 
    end
  end

  def update
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )
      redirect_to task_path
    else
      render :edit
    end
  end

  def edit 
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
    end
  end

  def destroy
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
      redirect_to @task
    else
      render :new
    end
  end
end 