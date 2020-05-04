class TasksController < ApplicationController
  def index # index means list all
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id].to_i)
    if @task.nil?
      head :not_found
      redirect_to tasks_path
      return
    end
    if @task.status == "complete"
      task.completed_at
    end
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description],
    )
      redirect_to task_path
      return
    else
      render :edit
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

  def destory
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head :not_found
      return
    else
      @task.destroy
      redirect_to tasks_path
    end
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      status: "not complete",
    )
    if task.save
      redirect_to task_path(task.id)
      return
    else
      render :new, :bad_request
      return
    end
  end

  def mark_complete
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    else @task.update(
      status: "completed",
      completed_at: Time.now,
    )
      redirect_to task_path
      return     end
  end

  def unmark_complete
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    else @task.update(
      status: "not complete",
      completed_at: nil,

    )
      redirect_to task_path
      return     end
  end
end
