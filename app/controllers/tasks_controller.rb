class TasksController < ApplicationController
  def index
    @tasks = Task.order("id")
  end

  def show
    @task = Task.find_by(id: params[:id])
    return redirect_to :tasks if @task.nil?
  end

  def new 
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save 
      return redirect_to @task
    else
      return render :new
    end
  end

  def edit 
    @task = Task.find_by(id: params[:id])
    return redirect_to :tasks if @task.nil?
  end

  def update
    @task = Task.find_by(id: params[:id])
    return redirect_to :tasks if @task.nil?
    return redirect_to task_path if @task.update(task_params)
    return render :edit
  end

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end



end
