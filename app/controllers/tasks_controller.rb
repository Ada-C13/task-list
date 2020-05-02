class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i 
    @task = Task.find_by(id: task_id)  
    
    if @task.nil?
      # head :not_found
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
      completed_at: nil,
      description: params[:task][:description],
    ) 
    if @task.save 
      redirect_to task_path(@task.id) 
      return
    else 
      render :new 
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
      return
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(task_params)
      redirect_to task_path(@task.id) 
      return
    else 
      render :edit 
      return
    end
  end

  def destroy
    task_id = params[:id]
    task = Task.find_by(id: task_id)

    if task.nil?
      head :not_found
      return
    end

    task.destroy
    redirect_to tasks_path
   
  end

  def completed_at
    task_id = params[:id]
    task = Task.find_by(id: task_id)

    if task.nil?
      head :not_found
      return
    end
    
    if task.completed_at 
      task.completed_at = nil
    else
      task.completed_at = Time.now
    end

    task.save
    redirect_to tasks_path
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
