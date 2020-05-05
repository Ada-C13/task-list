class TasksController < ApplicationController
  def index
    #array of hard-coded tasks
    # @tasks_array = ["Run Laundry", "Make Tea", "Finish a Sewing Project", "Draft a Sewing Pattern", "Weed the Yard"]
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name: params[:task][:name], 
      description: params[:task][:description], 
      completed_at: params[:task][:completed_at])
    if @task.save
      redirect_to tasks_path
      return
    else
      render :new, :bad_request
      return
    end
  end

  def edit
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)
  end
end
