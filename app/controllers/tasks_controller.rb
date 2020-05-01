TASKS = [
  { name: "Task One", description: "Drink Water" },
  { name: "Task Second", description: "Get Ready for the day" },
  { name: "Task Third", description: "Wake up" },

]

class TasksController < ApplicationController
  def index # index means list all
    @tasks = TASKS
  end

  def show
    task_id = params[:id].to_i
    @task = TASKS[task_id]
    if @task.nil?
      head :not_found
      return
    end
  end
end
