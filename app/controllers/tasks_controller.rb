class TasksController < ApplicationController
  
  # TASKS = [
  #   { description: "Wash hair"},
  #   { description: "Finish readings"},
  #   { description: "Make dinner"}
  # ]
  
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

end
