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
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
      )
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
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )
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


end
