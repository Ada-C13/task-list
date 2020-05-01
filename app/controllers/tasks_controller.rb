
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

  # Video 15 Rails Forms
  def new
    @task = Task.new
  end

  def create
    @task = Task.new( 
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at]
    )
    if @task.save
      redirect_to tasks_path
    else
      render :new, :bad_request
    end
  end

  # def update
  # end
  # def edit
  # end
  # def destroy
  # end
  
  # def mark_done
  # end
end
