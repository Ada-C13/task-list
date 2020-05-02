# TASKS = [
#   {todo: "more hello", text: "more stuff"},
#   {todo: "no hello", text: "more stuff"}
# ]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end


  def show
    task_id = params[:id].to_i # this special params variable lets us get info that has been passed in to the controller
    @task = Task.find_by(id: task_id)  # in this case it is the id that has been passed in through the route
    
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
      completed_at: nil,
      description: params[:task][:description],
    ) #instantiate a new task
    if @task.save # save returns true if the database insert succeeds
      redirect_to task_path(@task.id) # go to the index so we can see the task in the list
      return
    else # save failed :(
      render :new # show the new task form view again
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


  def update
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
      return
    elsif @task.update(task_params)
      redirect_to task_path(@task.id) # go to the index so we can see the task in the list
      return
    else # save failed :(
      render :edit # show the new task form view again
      return
    end
  end

  def destroy
    task_id = params[:id]
    @task = Task.find_by(id: task_id)

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
