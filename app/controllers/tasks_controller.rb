class TasksController < ApplicationController

  def index
   @tasks = Task.all
  end

  def show
    task_id = params[:id]
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
      redirect_to task_path(@task.id)
      return
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to task_path(@task.id)
      return
    end

    if @task.update(
      name: params[:task][:name], 
      description: params[:task][:description], 
      completed_at: params[:task][:completed]
    )
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

  def mark_complete
    @task = Task.find_by(id: params[:id])
    if @task.completed_at
      @task.update(completed_at: nil)
      redirect_to tasks_path
      return
    else
      @task.update(completed_at: Time.new)
      redirect_to tasks_path
      return
    end
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed)
  end

end
