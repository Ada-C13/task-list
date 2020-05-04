
class TasksController < ApplicationController

  def index
    @tasks = Task.all.order("id")
  end 

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id )

    if @task.nil? 
      redirect_to tasks_path
      return 
    end 

  end 

  def new 
    @task = Task.new
  end 

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.id)
      return 
    else 
      render :new
      return 
    end 
  end 


  def edit 
    @task = Task.find_by(id: params[:id])

    if @task.nil? 
      redirect_to tasks_path
      return 
    end 

  end 

  def update
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id )

    if @task.nil?
      head :not_found
      return 
    elsif @task.update(task_params)
      redirect_to task_path(task_id)
      return 
    else 
      render :edit 
      return 
    end 
  end 

  def destroy
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id )

    if @task.nil? 
      head :not_found
      return 
    else  
      @task.destroy
      redirect_to tasks_path
    end 
  end 

  def markcomplete

    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil? 
      head :not_found
      return 
    end 

    if @task.completed_at.nil?
      @task.completed_at = Time.now
      @task.save
      redirect_to tasks_path
      return 
    else  
      @task.completed_at = nil
      @task.save
      redirect_to tasks_path
      return 
    end 

  end 

  private 

  def task_params 
    return params.require(:task).permit(:name, :description, :completed_at)
  end 
  
end
