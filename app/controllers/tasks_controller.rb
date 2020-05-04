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
      description: params[:task][:description],
      completed_at: params[:task][:completed_at],
    )

    if @task.save
      redirect_to task_path(@task.id)
    else
      render :new, :bad_request
    end
  end

  def edit
    # Find the task by ID to show it in the form to edit it.
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path
      return
    end
  end

  def update
    # Find the task based on the ID.
    @task = Task.find_by(id: params[:id])
    # Return 404 if the ID does not exist.
    if @task.nil?
      head :not_found
      return
      # If the task exist edit (patch) the field.
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description],
      completed_at: params[:task][:completed_at],
    )
      # go to the index so we can see the task edited in the list
      redirect_to tasks_path
      return
    else # save failed :(
      render :edit # show the new task form view again
      return
    end
  end
end
