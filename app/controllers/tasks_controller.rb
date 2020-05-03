class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      redirect_to tasks_path
    end  
  end

  def new
    @task = Task.new
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
      render :new
      return
    end
  end

  def mark_complete
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      status: 'completed',
      completed_at: Time.now
    )
      redirect_to tasks_path
      return
    else 
      raise
      return
    end
  end

  def edit
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end  
  end

  def destroy
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    elsif 
      @task.destroy
      redirect_to tasks_path 
      return
    else 
      render @task
      return
    end

  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render :new, :bad_request
    end
  end

  private 

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at, :status)
  end

end
