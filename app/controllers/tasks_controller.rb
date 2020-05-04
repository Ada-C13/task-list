# TASKS = [
#   { name: "Walk the Dogs", description: "Bone and Noodle like to go for a walk for about 30 minutes."},
#   { name: "Clean the Kitchen", description: "Unload and load the dishwasher, wipe the counters, and sweep the floor."},
#   { name: "Take a Nap", description: "You've earned a rest."}
# ]


class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id]
    @task = Task.find_by(id: task_id)
    if @task.nil?
      head :not_found
      return
    end
  end
  
  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(
      name: params[:task][:name],
      description: params[:task][:description]
    )
      redirect_to tasks_path
      return
    else
      render :edit
      return
    end
  end

  def mark_done

  end

  def destroy

  end

  def create
    @task = Task.new(
      name: params[:task][:name],
      description: params[:task][:description]
    )

    if @task.save
      redirect_to tasks_path # Send them to the list of all tasks
      return
    else
      render :new, :bad_request # show the new book form again
      return
    end
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
      return
    end
  end

end