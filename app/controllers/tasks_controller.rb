
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

  # Video 15 Rails Forms
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
      redirect_to task_path(@task.id) # or show all task by using redirect_to tasks_path
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
      redirect_to edit_task_path
    elsif @task.update(
      name: params[:task][:name], 
      description: params[:task][:description], 
      completed_at: params[:task][:completed_at])
      redirect_to task_path 
    else 
      render :edit
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
  
  # def mark_done
  #   @task = Task.find_by(id: params[:id])
  #   if @task.nil?
  #     redirect_to tasks_path
  #   elsif @task.update(
  #     name: params[:task][:name], 
  #     description: params[:task][:description], 
  #     completed_at: params[:task][:completed_at])
  #     redirect_to tasks_path 
  #   else 
  #     render :edit
  #   end
  # end
end
