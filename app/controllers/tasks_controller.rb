
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new( task_params)
    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new, :bad_request
    end
  end
  
  def edit
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path
    end
  end
    
  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(task_params)
      redirect_to task_path 
      return
    else 
      render :edit
      return
    end
  end
   
  def destroy
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      redirect_to tasks_path
      return
    end

    @task.destroy
    redirect_to tasks_path
    return 
  end
  
  def mark_done
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path
      return
    elsif !@task.completed_at
      # Resource: https://thoughtbot.com/blog/its-about-time-zones
      @task.update( completed_at: Date.today )
      redirect_to tasks_path 
      return
    elsif @task.completed_at
      @task.update( completed_at: nil)
      redirect_to tasks_path 
      return
    end
  end

  private
  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
