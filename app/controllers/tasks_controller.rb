class TasksController < ApplicationController
  
  def index
    @tasks = Task.all.order(:id)
  end
  
  
  def show
    id = params[:id]
    @task = Task.find_by(id: id)
    
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end
  
  
  def new # form to add a new task
    @task = Task.new
  end
  
  
  def create # send new task data to database
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to task_path(@task.id)
      return
    else
      render :new
      return
    end
  end
  
  
  def edit # form to edit details for existing task
    id = params[:id]
    @task = Task.find_by(id: id)
    
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end
  
  
  def update # send updated task to database
    id = params[:id]
    @task = Task.find_by(id: id)
    
    if @task.nil?
      redirect_to tasks_path
      return
    elsif @task.update(task_params)
      redirect_to tasks_path
      return
    else 
      render :edit
      return
    end
  end
  
  
  def destroy # get rid of a task
    
    id = params[:id]
    @task = Task.find_by(id: id)
    
    if @task.nil?
      redirect_to tasks_path
      return
    end
    
    @task.destroy
    redirect_to tasks_path
  end
  
  
  def mark_complete
    id = params[:id]
    @task = Task.find_by(id: id)
    
    if @task.nil?
      redirect_to tasks_path
      return
    else @task.completed_at = Time.now
      @task.save
      redirect_to request.referrer || tasks_path
      return
    end
  end
  
  
  def mark_incomplete
    id = params[:id]
    @task = Task.find_by(id: id)
    
    if @task.nil?
      redirect_to tasks_path
      return
    else @task.completed_at = nil
      @task.save
      redirect_to request.referrer || tasks_path
      return
    end
  end
  
  private
  
  def task_params
    return params.require(:task).permit(:id, :name, :description, :completed_at)
  end
  
end