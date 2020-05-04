class TasksController < ApplicationController
  def index
    @tasks = Task.order(:id).all
  end 

  def new 
    @task = Task.new
  end

  def create 
    # raise
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_path(@task.id)
      return 
    else 
      render :new, :bad_request 
      return 
    end 
  end


  def show 
    # raise
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil? 
      redirect_to root_path
      return
    end
  end 

  
  def edit 
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      redirect_to root_path
      return 
    end
  end

  
  def update 
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      redirect_to root_path
      return 

    elsif @task.update(task_params)
      redirect_to task_path(@task.id)
      return 

    else  
      render :edit, :bad_request
      return 
    end 
  end

  
  def destroy 
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      redirect_to root_path
      return 
    else
      @task.destroy 
      redirect_to tasks_path 
      return
    end
  end


  def complete 
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil? 
      redirect_to root_path
      return 
    elsif !@task.completed_at
      @task.update(completed_at: Time.now) # update database
    else 
      @task.update(completed_at: nil)
    end 

    redirect_to tasks_path 
  end


  # reference: https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/forms-strong-params.md

  private 

  def task_params 
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
