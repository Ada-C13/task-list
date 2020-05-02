# TASKS = [
#   {name:"Task One", description: "Complete reading lessons"},
#   {name:"Task Two", description: "Complete Exercises"},
#   {name:"Task Three", description: "Work on the project"},
#   {name:"Task Four", description: "Spend at least an hour working on CS Fundamental"}
# ]


class TasksController < ApplicationController
  # Create an index method to show the list of all tasks
  def index 
    @tasks = Task.all
  end

  # Create a show method to show only one particular task
  def show
    task_id = params[:id].to_i
    @task = Task.find(task_id)
    if @task.nil?
      head :not_found
      return
    end
  end 

  # Create a new method to display a form for adding a new task 
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(
      name:params[:task][:name],
      description: params[:task][:description]
    )
    if @task.save
      redirect_to task_path(@task.id) # redirect the user to the list of tasks so they can see if the new task is added
    else
      render :new, :bad_request
    end
  end
end
