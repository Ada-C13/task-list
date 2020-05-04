class TasksController < ApplicationController
  def index
    @tasks = Task.all.order(:created_at)
  end

  def show
    @task = Task.find_by(id: params[:id].to_i)
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
      name: params[:task][:name],
      description: params[:task][:description])

    if @task.save
      redirect_to task_path(@task.id)
      return
    else
      render :new
      return
    end
  end

  def edit
    id = params[:id]
    @task = Task.find_by(id: id)

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
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description])

      redirect_to tasks_path
      return
    else 
      render :edit 
      return
    end
  end

  def destroy
    id = params[:id]
    @task = Task.find_by(id: id)

    if @task.nil?
      head :not_found
      return
    end

    @task.destroy

    redirect_to tasks_path
    return
  end

  def complete
    @task = Task.find_by(id: params[:id])

    return  head :not_found if @task.nil?
   
    if @task.completed_at == nil
      @task.update(completed_at: Time.now)
    elsif @task.completed_at != nil
      @task.update(completed_at: nil)
    end

    redirect_to tasks_path
  end
end
