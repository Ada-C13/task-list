class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  
  def new
    @task = Task.new
  end
  
  def show
    id = params[:id].to_i

    @task = Task.find(id)

    # source: https://stackoverflow.com/questions/6664822/rails-how-to-redirect-if-record-is-not-found
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, :flash => { :error => "Record not found." }
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
      return
    else
      render :new, :bad_request
      return
    end
  end

  def update
    id = params[:id].to_i
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(task_params)
      redirect_to tasks_path
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

  def complete
    id = params[:id].to_i
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      completed_at: Time.now
    )
    end
    redirect_to tasks_path
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

  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end

end
