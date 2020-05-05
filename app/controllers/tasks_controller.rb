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
    return redirect_to @task if @task.save
    return render :new
  end

  def edit 
    @task = Task.find_by(id: params[:id])
    return redirect_to :tasks if @task.nil?
  end

  def update
    @task = Task.find_by(id: params[:id])
    return redirect_to :task if @task.nil?
    return redirect_to task_path if @task.update(task_params)
    return render :edit
  end

  def toggle
    @task = Task.find_by(id: params[:id])
    return redirect_to :task if @task.nil?
    @time_toggle = @task.completed_at.empty? ? Time.now.strftime("%d/%m/%Y") : ""
    @task.update(completed_at: @time_toggle )
    return redirect_to :tasks
  end

  def destroy 
    @task = Task.find_by(id: params[:id])
    return redirect_to :task if @task.nil?
    return redirect_to tasks_path  if @task.destroy
    
  end

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end

end
