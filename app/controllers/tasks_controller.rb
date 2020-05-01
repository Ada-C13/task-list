class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end  
  end

  def new
    @task = Task.new
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description]
    )
      redirect_to task_path 
      return
    else 
      render :new
      return
    end
  end

  def mark_complete
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      completed_at: 'completed'
    )
      redirect_to 'tasks'
      return
    else 
      raise
      return
    end
  end

  def edit
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end  
  end

  def destroy
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    elsif 
      @task.destroy
      redirect_to tasks_path 
      return
    else 
      render @task
      return
    end

  end

  def create
    @task = Task.new(
      name: params[:task][:name], 
      description: params[:task][:description])

    if @task.save
      redirect_to @task
    else
      render :new, :bad_request
    end
  end

end
