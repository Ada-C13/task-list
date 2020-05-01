# TASKS = [
#   {name:"clean the dishes"},
#   {name:"check email"},
#   {name:"practice interview questions"}
# ]


class TasksController < ApplicationController

  def index
    @tasks = Task.all
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
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at:params[:task][:completed_at]
    )
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
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )
      redirect_to task_path(task_id)
      return 
    else 
      render :edit 
      return 
    end 
  end 

  def destory
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
    raise 
  end 

  
end
