class TasksController < ApplicationController
  
  TASKS = [
    { description: "Wash hair"},
    { description: "Finish readings"},
    { description: "Make dinner"}
  ]
  
  def index
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
