class ApplicationController < ActionController::Base
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
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
    @task = Task.new(
      name: params[:task][:name], 
      completed_at: nil, 
      description: params[:task][:description],
    ) 

    if @task.save #
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
    elsif @task.update(
      name: params[:task][:name], 
      completed_at: params[:task][:completed_at], 
      description: params[:task][:description]
    )
      redirect_to task_path(@task.id)
      return
    else 
      render :edit 
      return
    end
  end

  def destroy
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end

    @task.destroy

    redirect_to tasks_path
    return
  end

  def completed
    task = Task.find_by(id: params[:id])

    if task.nil?
      redirect_to task_path
      return
    end

    if task.task_completed == false
      task.task_completed, @task.completed_at = true, Date.today
      task.save
      redirect_to tasks_path
    else
      task.task_completed, @task.completed_at = false, nil 
      task.save
      redirect_to tasks_path
    end
  end
end
