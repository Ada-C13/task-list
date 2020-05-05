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
    @task = Task.new(task_params)

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
    # will redirect to the root page if given an invalid id
    if @task.nil?
      redirect_to root_path
      return
      # If the task exist edit (patch) the field.
    elsif @task.update(task_params)
      # go to the index so we can see the task edited in the list
      redirect_to tasks_path
      return
    else # save failed :(
      render :edit # show the new task form view again
      return
    end
  end

  def completed_at
    task_id = params[:id]
    task = Task.find_by(id: task_id)

    if task.nil?
      head :not_found
      return
    elsif task.completed_at
      task.completed_at = nil
    else
      time = Time.now
      task.completed_at = time.strftime("%d of %B, %Y")
    end

    task.save
    redirect_to tasks_path
  end

  def destroy
    task = Task.find_by(id: params[:id])
    if task.nil?
      head :not_found
      return
    else
      task.destroy
      redirect_to root_path
    end
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :completed_at)
  end
end
