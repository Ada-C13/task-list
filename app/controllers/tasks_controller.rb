class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def complete
    @task = Task.find_by(id: params[:id])

    @task.update(completed_at: Time.today)

    redirect_to task_path(@task.id)
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)

    if @task.nil?
      head :not_found
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
      head :not_found
      return
    end
  end

  def update
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
      return
    elsif
      @task.update(task_params)
      redirect_to task_path(@task.id)
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
    else
      @task.destroy
      redirect_to tasks_path
    end
  end
  
end
