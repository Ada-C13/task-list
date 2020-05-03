class TasksController < ApplicationController
  def index
    @tasks = Task.order(:id).all
  end 

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


  def show 
    # raise
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil? 
      redirect_to tasks_path
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
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
      )

      redirect_to task_path
      return 

    else  
      render :edit, :bad_request
      return 
    end 
  end

  
  def destroy 
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task 
      @task.destroy 
      redirect_to tasks_path 
    else 
      render :notfound, :bad_request # TODO
    end
  end


  def complete 
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.completed_at == nil 
      @task.update(completed_at: Time.now) # update database
    else 
      @task.update(completed_at: nil)
    end 

    redirect_to tasks_path 
  end
end
