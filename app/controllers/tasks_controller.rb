class TasksController < ApplicationController
  TASKS = [
    {name: "cs_fun", description: "watch video", completed_at: "Wednesday EOD"},
    {name: "interview prep", description: "work with peer", completed_at: "Friday EOD"},
    {name: "task_list", description: "Baseline", completed_at: "Wednesday by 11am"},
  ]
  # Controller Actions are always methods
  # index is a method
  def index #index means to list all
    @tasks = TASKS
  end

  def show
    # special params hash
    # the id was passed into the route
    id = params[:id].to_i
    @task =  TASKS[id]

    if @task.nil?
      head :not_found
      return
    end
  end
end

