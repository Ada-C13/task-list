# TASKS = [
#   { number: "Task one", text: "Mark Complete"},
#   { number: "Task two", text: "Unmark Complete"},
#   { number: "Task three", text: "Mark Complete again"}
# ]



class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # Raise an exception.
    # Be aware that any string will be converted to 0
    task_id = params[:id].to_i
    # It needs to handle this exception. 
    @task = Task.find_by(id: task_id) 
    
    puts @task

    if @task.nil?
      head :not_found
      return 
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at])

    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new, :bad_request
    end
  end

end
