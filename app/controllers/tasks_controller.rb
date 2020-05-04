class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
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
      task_params
      # name: params[:task][:name],
      # description: params[:task][:description],
      # completed_at: nil,
    )

    if @task.save
      redirect_to task_path(@task.id)
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
      redirect_to root_path
      return
    elsif
      @task.update(
        task_params
        # name: params[:task][:name],
        # description: params[:task][:description],
        # completed_at: @task.completed_at || params[:task][:completed_at],
        # completed_at: params[:task][:completed_at],
      )
      redirect_to task_path
      return
    else
      render :edit
      return
    end
  end

  def destroy
    task = Task.find_by(id: params[:id])

    if task.nil?
      head :not_found
      return
    else
      task.destroy
      redirect_to tasks_path
    end
  end

  private 

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
