class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # note: per my discussion with a teacher, since find throws an exception for invalid ids whereas find_by returns nil for invalid ids, it's easier to work with. I asked whether a begin/rescue block would work, and was encouraged to try it! 
    begin
      @task = Task.find(params[:id])
    rescue => error
      redirect_to root_path, alert: "Error: #{error}"
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    @task.save ? (redirect_to task_path(@task)) : (render :new, alert: "Error: Task not saved")
    return 
  end

  def edit
    begin
      @task = Task.find(params[:id]) 
    rescue => error
      redirect_to root_path, alert: "Error: #{error}"
      return
    end
  end

  def update
    begin
      @task = Task.find(params[:id]) 
    rescue => error
      redirect_to root_path, alert: "Error: #{error}"
      return
    end
    
    @task.update(task_params) ? (redirect_to task_path(@task)) : (render :edit, alert: "Error: Task not updated")
    return
  end

  def delete
    begin
      @task = Task.find(params[:id]) 
    rescue => error
      redirect_to root_path, alert: "Error: #{error}"
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
      redirect_to root_path, alert: "Error: #{error}"
      return
    end

    if @task[:completed_at].nil? || @task[:completed_at].empty?
      @task.update(
        completed_at: Time.now
      ) ? (redirect_to root_path) : (redirect_to root_path, alert: "Error: Task unable to be marked as complete")
      return
    else
      @task.update(
        completed_at: nil
      ) ? (redirect_to root_path) : (redirect_to root_path, alert: "Error: Task unable to be marked as incomplete")
      return
    end
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
