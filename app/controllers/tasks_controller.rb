class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end 

  def show 
    # raise
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil? 
      redirect_to tasks_path
      return
    end
  end 


  # def update 
  #   @task = Task.find_by(id: params[:id])

  #   if @task.nil?
  #     head :not_found 
  #     return 
  #   elsif @task.update(
  #     name: params[:task][:name],
  #     description: params[:task][:description]
  #   )

  #   redirect_to tasks_path 
  #   return 

  #   else  
  #     render :edit 
  #     return 
  #   end 
  # end


  def new 
    @task = Task.new
  end

  def create 
    # raise
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )

    if @task.save
      redirect_to task_path(@task.id)
      return 
    else 
      render :new, :bad_request 
      return 
    end 
  end
end
