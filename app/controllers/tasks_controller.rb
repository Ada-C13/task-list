class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :temporary_redirect
      return
    end
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new name: params[:task][:name], description: params[:task][:description], completed_at: params[:task][:completed_at]

    if task.save
      redirect_to task_path(task.id) ##TODO- ask why the completed at is not being saved????
    else
      render :new, :bad_request
    end
  end
end
