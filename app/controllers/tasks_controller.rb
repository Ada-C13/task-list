class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    begin
      @task = Task.find(params[:id]) 
    rescue => error
      redirect_to root_path, alert: "#{error}"
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name: params[:task][:name], 
      description: params[:task][:description]
    )

    @task.save ? (redirect_to task_path(@task)) : (render :new, alert: "Error: Task not saved")
    return 
  end

  def edit
    begin
      @task = Task.find(params[:id]) 
    rescue => error
      redirect_to root_path, alert: "#{error}"
      return
    end
  end

  def update
    begin
      @task = Task.find(params[:id]) 
    rescue => error
      redirect_to root_path, alert: "#{error}"
      return
    end

    @task.update(
      name: params[:task][:name], 
      description: params[:task][:description]
    ) ? (redirect_to task_path(@task)) : (render :edit, alert: "Error: Task not updated")
    return
  end
end