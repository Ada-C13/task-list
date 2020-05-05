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

  def delete
    begin
      @task = Task.find(params[:id]) 
    rescue => error
      redirect_to root_path, alert: "#{error}"
      return
    end

    @task.destroy
    
    redirect_to root_path
    return
  end

  def toggle_complete
    begin
      @task = Task.find(params[:id]) 
    rescue => error
      redirect_to root_path, alert: "#{error}"
      return
    end

    if @task[:completed_at].nil?
      @task.update(
        completed_at: Time.now
      ) ? (redirect_to root_path) : (redirect_to root_path, alert: "Error: Task unable to be marked as complete")
    else
      @task.update(
        completed_at: nil
      ) ? (redirect_to root_path) : (redirect_to root_path, alert: "Error: Task unable to be marked as incomplete")
    end
  end
end