class TasksController < ApplicationController
  
  # shows list of tasks
  def index
    @tasks = Task.all.sort
  end

  # shows individual task details
  def show
    @task = Task.find_by(id: params[:id])
    redirect_to tasks_path if @task.nil?
  end

  # creates a form
  def new 
    @task = Task.new
  end
  
  # form submit button calls this
  def create
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )
    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new
    end
  end
  
  # prepares the task data to edit it
  def edit
    @task = Task.find_by(id: params[:id])
    redirect_to tasks_path if @task.nil?
  end

  # updates the task with the data from the form
  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path
    elsif @task.update(
        name: params[:task][:name],
        description: params[:task][:description],
        completed_at: params[:task][:completed_at]
      )
      redirect_to task_path(@task.id)
    else
      render :edit
    end
  end

  # deletes a task
  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy unless @task.nil?
    redirect_to tasks_path
  end

  # marks a task completed
  def complete
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path
    else
      @task.update_column(:completed_at, DateTime.now())
      redirect_to task_path(@task.id)
    end
  end

    # marks a task as not completed
    def uncomplete
      @task = Task.find_by(id: params[:id])
      if @task.nil?
        redirect_to tasks_path
      else
        @task.update_column(:completed_at, nil)
        redirect_to task_path(@task.id)
      end
    end
  

end