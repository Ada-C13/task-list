class TasksController < ApplicationController
  def index
    #array of hard-coded tasks
    # @tasks_array = ["Run Laundry", "Make Tea", "Finish a Sewing Project", "Draft a Sewing Pattern", "Weed the Yard"]
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    if @task.nil?
      head :not_found
      return
    end
  end
end
