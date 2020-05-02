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
end
