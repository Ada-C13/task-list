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
    @task = Task.new(book_params) # strong params
    
    if @task.save
      redirect_to task_path(@task.id)
      return
    else
      render :new, :bad_request
      return
    end
  end

  def edit 
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      redirect_to tasks_path
      return
    end
  end

  def update 
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      redirect_to root_path
      return
    end

    result = @task.update(book_params) # strong params
    
    if result
      redirect_to task_path(@task.id)
      return
    else
      render :edit
      return
    end
  end

  def destroy
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end

    @task.destroy
    redirect_to tasks_path 
  end

  def complete 
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end

    @task.update(
      completed_at: Time.now
    )

    if @task.save
      redirect_to tasks_path
      return
    else
      render :tasks, :bad_request
      return
    end
  end

  private

  def book_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
