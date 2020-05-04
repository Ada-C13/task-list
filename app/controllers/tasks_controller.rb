class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy, :mark_complete]
  
  def index
    # added in order so this won't change the order even after updating a task
    @tasks = Task.order(:id).all
  end

  def show
    if @task.nil?
      redirect_to tasks_path, notice: 'Task not found'
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(id: @task.id), notice: 'Task was successfully created.' 
    else
      render :new, :bad_request
      return
    end
  end

  def edit
    if @task.nil?
      redirect_to root_path, notice: 'Task not found'
      return
    end
  end

  def update
    if @task.nil?
      redirect_to root_path, notice: 'Task not found'
    elsif
      if @task.update(task_params)
        redirect_to task_path(id: @task.id), notice: 'Task was successfully updated.'
      else
        render :edit, :bad_request
      end
      return
    end
  end

  def destroy
    if @task.destroy
      redirect_to root_path, notice: 'Task was successfully removed.'
    end
  end

  def mark_complete
    if @task.nil?
      head :not_found
      return
    elsif
      if @task.completed_at != '' && @task.completed_at != nil 
        @task.update(
          completed_at: nil
        )
        redirect_to task_path(id: @task.id), notice: 'Need some more time, I guess?'
      else 
        @task.update(
          completed_at: Time.now.in_time_zone("Pacific Time (US & Canada)")
        )
        redirect_to task_path(id: @task.id), notice: 'YAY! Task Completed!' 
      end
    end
    return
  end


  private
  # helper methods to help DRY up some codes
  def find_task
    id = params[:id].to_i
    @task = Task.find_by(id: id)
  end

  # to prevent people from submitting additional field whatever they want
  def task_params
    return params.require(:task).permit(:name, :description)
  end

end
