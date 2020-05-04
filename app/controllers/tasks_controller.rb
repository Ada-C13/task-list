class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
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
    @task = Task.new(name: params[:task][:name], description: params[:task][:description])
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
      redirect_to tasks_path
      return
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(name: params[:task][:name], description: params[:task][:description], completed_at: params[:task][:completed_at])
    redirect_to task_path(@task.id)
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path
    else
      @task.destroy
      redirect_to tasks_path
    end
  end
end
