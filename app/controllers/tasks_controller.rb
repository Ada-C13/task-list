class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id].to_i)
    if @task.nil?
      redirect_to root_path
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)

    if task.save
      redirect_to task_path(task.id)
    else
      render :new, :bad_request
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
    elsif @task.update(task_params)
      redirect_to task_path
      return
    else
      render :edit
      return
    end
  end

  def mark_complete
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      completed_at: Time.now
    )
      redirect_to root_path
      return
    else
      render :edit
      return
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.destroy
      redirect_to root_path
      return
    else
      render :show
      return
    end
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
